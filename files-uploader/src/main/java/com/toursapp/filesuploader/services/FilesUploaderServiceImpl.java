package com.toursapp.filesuploader.services;

import com.toursapp.filesuploader.controllers.exceptions.FileDeletingException;
import com.toursapp.filesuploader.controllers.exceptions.FileFetchingException;
import com.toursapp.filesuploader.controllers.exceptions.FileUploadingException;
import com.toursapp.filesuploader.entities.Enums.FileType;
import com.toursapp.filesuploader.entities.FileInfo;
import com.toursapp.filesuploader.repositories.FileRepository;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class FilesUploaderServiceImpl implements FilesUploaderService {
    private final Path rootImages = Paths.get("images");
    private final Path rootAudios = Paths.get("audios");

    @Autowired
    FileRepository repository;

    @Override
    public void init() {
        try {
            Files.createDirectory(rootImages);
            Files.createDirectory(rootAudios);
        } catch (IOException e) {
            throw new RuntimeException("Could not initialize folder for images and audios!");
        }
    }

    @Override
    public String saveImage(MultipartFile file, Integer user_id) {
        try {
            String fileName = saveFileInfo(file, user_id, FileType.IMAGE);
            Files.copy(file.getInputStream(), this.rootImages.resolve(fileName));
            return fileName;
        } catch (IOException | RuntimeException e) {
            throw new FileUploadingException(FileType.IMAGE);
        }
    }

    @Override
    public String saveAudio(MultipartFile file, Integer user_id) {
        try {
            String fileName = saveFileInfo(file, user_id, FileType.AUDIO);
            Files.copy(file.getInputStream(), this.rootAudios.resolve(file.getOriginalFilename()));
            return fileName;
        } catch (IOException | RuntimeException e) {
            throw new FileUploadingException(FileType.AUDIO);
        }
    }

    private String saveFileInfo(MultipartFile file, Integer user_id, FileType type) {
        UUID fileName = UUID.randomUUID();
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        FileInfo newImage = new FileInfo();
        newImage.setId(fileName.toString());
        newImage.setExtension(extension);
        newImage.setUserId(user_id);
        newImage.setType(type);
        repository.save(newImage);
        return fileName.toString();
    }

    @Override
    public Resource loadImage(String filename) {
        try {
            Path file = rootImages.resolve(filename);
            Resource resource = new UrlResource(file.toUri());
            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new FileFetchingException(FileType.IMAGE, filename);
            }
        } catch (MalformedURLException e) {
            throw new FileFetchingException(FileType.IMAGE, filename);
        }
    }

    @Override
    public Resource loadAudio(String filename) {
        try {
            Path file = rootAudios.resolve(filename);
            Resource resource = new UrlResource(file.toUri());
            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new FileFetchingException(FileType.AUDIO, filename);
            }
        } catch (MalformedURLException e) {
            throw new FileFetchingException(FileType.AUDIO, filename);
        }
    }


    @Override
    public void deleteFile(String filename, FileType type) {
        Path filePath;
        try {
            repository.deleteById(filename);
            if (type.equals(FileType.IMAGE)) {
                filePath = rootImages.resolve(filename);
            }
            else {
                filePath = rootAudios.resolve(filename);
            }
            Files.delete(filePath);
        } catch (IOException e) {
            throw new FileDeletingException(type, filename);
        }
    }

    @Override
    public List<FileInfo> loadAll(Integer user_id, FileType type) {
        List<FileInfo> files = new ArrayList<>();
        repository.findByUserIdAndType(user_id, type).forEach(files::add);
        return files;
    }
}

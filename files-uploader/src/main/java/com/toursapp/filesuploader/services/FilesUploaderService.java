package com.toursapp.filesuploader.services;

import com.toursapp.filesuploader.entities.Enums.FileType;
import com.toursapp.filesuploader.entities.FileInfo;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.List;
import java.util.stream.Stream;

public interface FilesUploaderService {
    void init();
    String saveImage(MultipartFile file, String user_id);
    String saveAudio(MultipartFile file, String user_id);
    Resource loadImage(String filename);
    Resource loadAudio(String filename);
    void deleteFile(String filename, FileType type);
    List<FileInfo> loadAll(String user_id, FileType type);
}

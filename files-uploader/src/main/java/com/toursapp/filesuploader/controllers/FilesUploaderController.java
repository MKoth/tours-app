package com.toursapp.filesuploader.controllers;

import com.toursapp.filesuploader.entities.Enums.FileType;
import com.toursapp.filesuploader.entities.FileInfo;
import com.toursapp.filesuploader.services.FilesUploaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/files-uploader")
public class FilesUploaderController {
    @Autowired
    FilesUploaderService service;

    @PostMapping("/image/upload/{userId}")
    List<FileInfo> uploadImage(@RequestParam("file") MultipartFile file, @PathVariable String userId) {
        service.saveImage(file, userId);
        return service.loadAll(userId, FileType.IMAGE);
    }

    @PostMapping("/audio/upload/{userId}")
    String uploadAudio(@RequestParam("file") MultipartFile file, @PathVariable String userId) {
        return service.saveAudio(file, userId);
    }

    @GetMapping("/file/image/{filename}")
    Resource getImage(@PathVariable String filename) {
        return service.loadImage(filename);
    }

    @GetMapping("/file/audio/{filename}")
    Resource getAudio(@PathVariable String filename) {
        return service.loadAudio(filename);
    }

    @DeleteMapping("/file/image/{userId}/{filename}")
    List<FileInfo> deleteImage(@PathVariable String userId, @PathVariable String filename) {
        service.deleteFile(filename, FileType.IMAGE);
        return service.loadAll(userId, FileType.IMAGE);
    }

    @DeleteMapping("/file/audio/{filename}")
    void deleteAudio(@PathVariable String filename) {
        service.deleteFile(filename, FileType.AUDIO);
    }

    @GetMapping("/images/{userId}")
    List<FileInfo> getImages(@PathVariable String userId) {
        return service.loadAll(userId, FileType.IMAGE);
    }
}

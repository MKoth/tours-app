package com.toursapp.filesuploader.controllers;

import com.toursapp.filesuploader.entities.Enums.FileType;
import com.toursapp.filesuploader.services.FilesUploaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/uploads")
public class FilesUploaderController {
    @Autowired
    FilesUploaderService service;

    @PostMapping("/image/upload/{userId}")
    String uploadImage(@RequestParam("file") MultipartFile file, @PathVariable Integer userId) {
        return service.saveImage(file, userId);
    }

    @PostMapping("/image/audio/{userId}")
    String uploadAudio(@RequestParam("file") MultipartFile file, @PathVariable Integer userId) {
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

    @DeleteMapping("/file/image/{filename}/")
    void deleteImage(@PathVariable String filename) {
        service.deleteFile(filename, FileType.IMAGE);
    }

    @DeleteMapping("/file/audio/{filename}/")
    void deleteAudio(@PathVariable String filename) {
        service.deleteFile(filename, FileType.AUDIO);
    }
}

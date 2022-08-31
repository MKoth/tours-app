package com.toursapp.filesuploader.controllers;

import com.toursapp.filesuploader.services.FilesUploaderService;
import org.springframework.beans.factory.annotation.Autowired;
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
}

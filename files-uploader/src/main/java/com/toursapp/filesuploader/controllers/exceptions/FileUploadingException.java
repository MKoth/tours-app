package com.toursapp.filesuploader.controllers.exceptions;

import com.toursapp.filesuploader.entities.Enums.FileType;

public class FileUploadingException extends RuntimeException {
    public FileUploadingException(FileType type) {
        super("Error while uploading " + (type == FileType.IMAGE ? "image" : "audio") + " file");
    }
}

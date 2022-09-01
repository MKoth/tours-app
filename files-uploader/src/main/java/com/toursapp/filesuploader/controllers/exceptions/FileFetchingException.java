package com.toursapp.filesuploader.controllers.exceptions;

import com.toursapp.filesuploader.entities.Enums.FileType;

public class FileFetchingException extends RuntimeException {
    public FileFetchingException(FileType type, String name) {
        super("Could not get " + (type == FileType.IMAGE ? "image" : "audio") + " file, by name '"+name+"'");
    }
}

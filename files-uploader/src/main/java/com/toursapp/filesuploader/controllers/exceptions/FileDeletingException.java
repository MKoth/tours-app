package com.toursapp.filesuploader.controllers.exceptions;

import com.toursapp.filesuploader.entities.Enums.FileType;

public class FileDeletingException extends RuntimeException {
    public FileDeletingException(FileType type, String name) {
        super("Could not delete " + (type == FileType.IMAGE ? "image" : "audio") + " file, by name '"+name+"'");
    }
}

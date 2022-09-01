package com.toursapp.filesuploader.controllers.advice;

import com.toursapp.filesuploader.controllers.exceptions.FileDeletingException;
import com.toursapp.filesuploader.controllers.exceptions.FileFetchingException;
import com.toursapp.filesuploader.controllers.exceptions.FileUploadingException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class FileOperationsExceptionAdvice {
    @ResponseBody
    @ExceptionHandler(FileFetchingException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    String fileNotFoundHandler(RuntimeException ex) {
        return ex.getMessage();
    }

    @ResponseBody
    @ExceptionHandler({FileDeletingException.class, FileUploadingException.class})
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    String fileDeletionUploadingHandler(RuntimeException ex) {
        return ex.getMessage();
    }
}

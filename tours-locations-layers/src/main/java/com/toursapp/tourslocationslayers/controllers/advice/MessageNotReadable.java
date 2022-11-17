package com.toursapp.tourslocationslayers.controllers.advice;

import com.ctc.wstx.shaded.msv_core.driver.textui.Debug;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.logging.Logger;

@ControllerAdvice
@Slf4j
public class MessageNotReadable {
    @ExceptionHandler
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handle(HttpMessageNotReadableException e) {
        log.warn("Returning HTTP 400 Bad Request", e);
        throw e;
    }
}

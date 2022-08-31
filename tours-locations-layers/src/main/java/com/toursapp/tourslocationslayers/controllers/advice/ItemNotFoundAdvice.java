package com.toursapp.tourslocationslayers.controllers.advice;

import com.toursapp.tourslocationslayers.controllers.exceptions.LayerNotFoundException;
import com.toursapp.tourslocationslayers.controllers.exceptions.LocationNotFoundException;
import com.toursapp.tourslocationslayers.controllers.exceptions.TagNotFoundException;
import com.toursapp.tourslocationslayers.controllers.exceptions.TourNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ItemNotFoundAdvice {
    @ResponseBody
    @ExceptionHandler({
            LayerNotFoundException.class,
            LocationNotFoundException.class,
            TagNotFoundException.class,
            TourNotFoundException.class
    })
    @ResponseStatus(HttpStatus.NOT_FOUND)
    String itemNotFoundHandler(RuntimeException ex) {
        return ex.getMessage();
    }
}

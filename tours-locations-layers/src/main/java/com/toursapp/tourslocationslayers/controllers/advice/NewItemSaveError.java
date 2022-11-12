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

import java.sql.SQLIntegrityConstraintViolationException;

@ControllerAdvice
public class NewItemSaveError {
    @ResponseBody
    @ExceptionHandler({
            SQLIntegrityConstraintViolationException.class
    })
    @ResponseStatus(HttpStatus.CONFLICT)
    String duplicateItem() {
        return "Item already exists";
    }
}

package com.toursapp.tourslocationslayers.controllers.exceptions;

public class TagNotFoundException extends RuntimeException {
    public TagNotFoundException(Integer id) {
        super("Could not find tag with id " + id);
    }
}

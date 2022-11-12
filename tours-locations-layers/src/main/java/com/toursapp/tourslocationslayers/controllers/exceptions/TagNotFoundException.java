package com.toursapp.tourslocationslayers.controllers.exceptions;

public class TagNotFoundException extends RuntimeException {
    public TagNotFoundException(Object id) {
        super("Could not find tag with id or name " + id);
    }
}

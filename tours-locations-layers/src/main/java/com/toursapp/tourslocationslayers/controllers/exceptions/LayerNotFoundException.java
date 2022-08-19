package com.toursapp.tourslocationslayers.controllers.exceptions;

public class LayerNotFoundException extends RuntimeException {
    public LayerNotFoundException(Integer id) {
        super("Could not find layer with id " + id);
    }
}

package com.toursapp.tourslocationslayers.controllers.exceptions;

public class TourNotFoundException extends RuntimeException {
    public TourNotFoundException(Integer id) {
        super("Could not find tour with id " + id);
    }
}

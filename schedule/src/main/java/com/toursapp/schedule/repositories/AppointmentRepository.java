package com.toursapp.schedule.repositories;

import com.toursapp.schedule.model.Appointment;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.awt.print.Pageable;
import java.time.LocalDateTime;
import java.util.List;

public interface AppointmentRepository extends MongoRepository<Appointment, String> {
    List<Appointment> findByTour_startBetween(LocalDateTime start, LocalDateTime end);
}

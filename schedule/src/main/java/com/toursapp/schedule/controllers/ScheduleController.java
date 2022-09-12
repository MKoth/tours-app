package com.toursapp.schedule.controllers;

import com.toursapp.schedule.model.Appointment;
import com.toursapp.schedule.model.Availability;
import com.toursapp.schedule.repositories.AppointmentRepository;
import com.toursapp.schedule.repositories.AvailabilityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/schedule")
public class ScheduleController {
    @Autowired
    private AvailabilityRepository availabilityRepository;

    @Autowired
    private AppointmentRepository appointmentRepository;

    @GetMapping("/availability/{user_id}")
    public Availability getAvailabilityInfo(@PathVariable Integer user_id) {
        return availabilityRepository.findByUserId(user_id);
    }

    @PostMapping("/availability")
    public void updateAvailabilityInfo(Availability availabilityInfo) {
        availabilityRepository.save(availabilityInfo);
    }

    @GetMapping("/appointments/{date_from}/{date_to}")
    public List<Appointment> getAppointmentsBetween(@PathVariable LocalDateTime start, @PathVariable LocalDateTime end) {
        return appointmentRepository.findByTour_startBetween(start, end);
    }

    @PostMapping("/appointments")
    public void saveAppointment(Appointment appointment) {
        appointmentRepository.save(appointment);
    }
}

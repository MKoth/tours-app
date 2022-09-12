package com.toursapp.schedule.repositories;

import com.toursapp.schedule.model.Availability;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AvailabilityRepository extends MongoRepository<Availability, String> {
    Availability findByUserId(Integer userId);
}

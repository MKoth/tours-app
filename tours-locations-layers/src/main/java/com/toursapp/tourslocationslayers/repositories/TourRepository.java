package com.toursapp.tourslocationslayers.repositories;

import com.toursapp.tourslocationslayers.entities.Tour;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

public interface TourRepository extends CrudRepository<Tour, Integer>,
        JpaSpecificationExecutor<Tour> {
}

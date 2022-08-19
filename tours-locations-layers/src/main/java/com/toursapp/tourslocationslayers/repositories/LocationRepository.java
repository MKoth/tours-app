package com.toursapp.tourslocationslayers.repositories;

import com.toursapp.tourslocationslayers.entities.Location;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

public interface LocationRepository extends CrudRepository<Location, Integer>,
        JpaSpecificationExecutor<Location> {
}

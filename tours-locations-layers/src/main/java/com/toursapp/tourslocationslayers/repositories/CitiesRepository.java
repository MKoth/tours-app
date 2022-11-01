package com.toursapp.tourslocationslayers.repositories;

import com.toursapp.tourslocationslayers.entities.City;
import org.springframework.data.repository.CrudRepository;

public interface CitiesRepository extends CrudRepository<City, Integer> {
    City findByNameIgnoreCase(String name);
}

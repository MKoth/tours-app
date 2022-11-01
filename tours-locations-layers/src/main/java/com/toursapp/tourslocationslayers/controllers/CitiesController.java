package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.entities.City;
import com.toursapp.tourslocationslayers.entities.Tag;
import com.toursapp.tourslocationslayers.repositories.CitiesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tours-locations-layers/city")
public class CitiesController {
    @Autowired
    CitiesRepository repository;

    @GetMapping
    List<City> getAll() {
        return (List<City>) repository.findAll();
    }

    @GetMapping("/name/{name}")
    City getCityByName(@PathVariable(value = "name") String name) {
        return repository.findByNameIgnoreCase(name);
    }

    @GetMapping("/{id}")
    City getCityById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id).orElseThrow();
    }

    @PostMapping
    City save(@RequestBody City city) {
        return repository.save(city);
    }
}

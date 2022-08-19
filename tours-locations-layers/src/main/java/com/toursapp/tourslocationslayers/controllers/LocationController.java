package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.controllers.exceptions.LocationNotFoundException;
import com.toursapp.tourslocationslayers.entities.Location;
import com.toursapp.tourslocationslayers.repositories.LocationRepository;
import com.toursapp.tourslocationslayers.repositories.specs.LocationSpecification;
import com.toursapp.tourslocationslayers.repositories.specs.SpecificationsBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LocationController {
    @Autowired
    LocationRepository repository;

    @GetMapping
    List<Location> getAll() {
        return (List<Location>) repository.findAll();
    }

    @PostMapping
    Location save(@RequestBody Location location) {
        return repository.save(location);
    }

    @GetMapping("/{id}")
    Location getById(@PathVariable Integer id) {
        // todo: add controller adviser to return 'not found', not 404
        return repository.findById(id).orElseThrow(() -> new LocationNotFoundException(id));
    }

    @DeleteMapping("/{id}")
    void deleteById(@PathVariable Integer id) {
        repository.deleteById(id);
    }

    @GetMapping("/filter")
    public List<Location> search(@RequestParam(value = "search") String search) {
        SpecificationsBuilder<Location> builder = new SpecificationsBuilder<>();
        Pattern pattern = Pattern.compile("(\\w+?)([:<>])(\\w+?),");
        Matcher matcher = pattern.matcher(search + ",");
        while (matcher.find()) {
            builder.with(matcher.group(1), matcher.group(2), matcher.group(3));
        }

        Specification<Location> spec = builder.build(LocationSpecification::new);
        return repository.findAll(spec);
    }
}

package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.controllers.exceptions.LocationNotFoundException;
import com.toursapp.tourslocationslayers.entities.Location;
import com.toursapp.tourslocationslayers.repositories.LocationRepository;
import com.toursapp.tourslocationslayers.repositories.specs.LocationSpecification;
import com.toursapp.tourslocationslayers.repositories.specs.SpecificationsBuilder;
import com.toursapp.tourslocationslayers.services.AuthenticatedUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
@RequestMapping("/tours-locations-layers/location")
public class LocationController {
    @Autowired
    LocationRepository repository;

    @Autowired
    AuthenticatedUserService authenticatedUserService;

    @GetMapping
    List<Location> getAll() {
        return (List<Location>) repository.findAll();
    }

    @PostMapping
    @PreAuthorize("@authenticatedUserService.canUserEditItem(#location.creator_id)")
    Location save(@RequestBody Location location) {
        return repository.save(location);
    }

    @GetMapping("/{id}")
    Location getById(@PathVariable Integer id) {
        return repository.findById(id).orElseThrow(() -> new LocationNotFoundException(id));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("@authenticatedUserService.canUserDeleteLocation(#id)")
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

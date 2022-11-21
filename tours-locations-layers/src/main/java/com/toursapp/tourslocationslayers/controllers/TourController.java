package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.controllers.exceptions.LocationNotFoundException;
import com.toursapp.tourslocationslayers.controllers.exceptions.TourNotFoundException;
import com.toursapp.tourslocationslayers.entities.Location;
import com.toursapp.tourslocationslayers.entities.Tour;
import com.toursapp.tourslocationslayers.repositories.TourRepository;
import com.toursapp.tourslocationslayers.repositories.specs.LocationSpecification;
import com.toursapp.tourslocationslayers.repositories.specs.SpecificationsBuilder;
import com.toursapp.tourslocationslayers.repositories.specs.TourSpecification;
import com.toursapp.tourslocationslayers.services.AuthenticatedUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.BearerTokenAuthentication;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
@RequestMapping("/tours-locations-layers/tour")
public class TourController {
    @Autowired
    TourRepository repository;

    @Autowired
    AuthenticatedUserService authenticatedUserService;

    @GetMapping
    List<Tour> getAll() {
        return (List<Tour>) repository.findAll();
    }

    @PostMapping
    @PreAuthorize("@authenticatedUserService.canUserEditItem(#tour.creator_id)")
    Tour save(@RequestBody Tour tour) {
        List<Location> locations = tour.getLocations();
        locations.forEach(location -> location.setTour(tour));
        return repository.save(tour);
    }

    @GetMapping("/{id}")
    Tour getById(@PathVariable Integer id) {
        return repository.findById(id).orElseThrow(() -> new TourNotFoundException(id));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("@authenticatedUserService.canUserDeleteTour(#id)")
    void deleteById(@PathVariable Integer id) {
        repository.deleteById(id);
    }

    @GetMapping("/filter")
    public List<Tour> search(@RequestParam(value = "search") String search) {
        SpecificationsBuilder<Tour> builder = new SpecificationsBuilder<>();
        Pattern pattern = Pattern.compile("(\\w+?)([:<>])(\\w+?),");
        Matcher matcher = pattern.matcher(search + ",");
        while (matcher.find()) {
            builder.with(matcher.group(1), matcher.group(2), matcher.group(3));
        }

        Specification<Tour> spec = builder.build(TourSpecification::new);
        return repository.findAll(spec);
    }
}

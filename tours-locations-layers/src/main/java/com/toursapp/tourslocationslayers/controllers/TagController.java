package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.controllers.exceptions.TagNotFoundException;
import com.toursapp.tourslocationslayers.controllers.exceptions.TourNotFoundException;
import com.toursapp.tourslocationslayers.entities.Tag;
import com.toursapp.tourslocationslayers.entities.Tour;
import com.toursapp.tourslocationslayers.repositories.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tours-locations-layers/tag")
public class TagController {
    @Autowired
    TagRepository repository;

    @GetMapping
    List<Tag> getAll() {
        return (List<Tag>) repository.findAll();
    }

    @PostMapping
    Tag save(@RequestBody Tag tag) {
        return repository.save(tag);
    }

    @GetMapping("/{id}")
    Tag getById(@PathVariable Integer id) {
        return repository.findById(id).orElseThrow(() -> new TagNotFoundException(id));
    }

    @GetMapping("/find")
    List<Tag> findByName(@RequestParam(value = "like") String like) {
        return (List<Tag>) repository.findByNameContainingIgnoreCase(like);
    }
}

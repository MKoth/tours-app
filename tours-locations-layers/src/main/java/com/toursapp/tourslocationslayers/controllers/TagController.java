package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.controllers.exceptions.TagNotFoundException;
import com.toursapp.tourslocationslayers.controllers.exceptions.TourNotFoundException;
import com.toursapp.tourslocationslayers.entities.Tag;
import com.toursapp.tourslocationslayers.entities.Tour;
import com.toursapp.tourslocationslayers.repositories.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tours-locations-layers/tag")
public class TagController {
    @Autowired
    TagRepository repository;

    @GetMapping
    List<Tag> getAll() {
        return repository.findAll(PageRequest.of(0, 5)).stream().toList();
    }

    @PostMapping
    Tag save(@RequestBody Tag tag) {
        return repository.save(tag);
    }

    @GetMapping("/{id}")
    Tag getById(@PathVariable Integer id) {
        return repository.findById(id).orElseThrow(() -> new TagNotFoundException(id));
    }

    @GetMapping("/name/{id}")
    Tag getById(@PathVariable String name) {
        return repository.findByName(name).orElseThrow(() -> new TagNotFoundException(name));
    }

    @GetMapping("/find")
    List<Tag> findByName(@RequestParam(value = "like") String like) {
        return (List<Tag>) repository.findByNameContainingIgnoreCase(like, PageRequest.of(0, 5));
    }
}

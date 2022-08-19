package com.toursapp.tourslocationslayers.controllers;

import com.toursapp.tourslocationslayers.controllers.exceptions.LayerNotFoundException;
import com.toursapp.tourslocationslayers.entities.Layer;
import com.toursapp.tourslocationslayers.repositories.LayerRepository;
import com.toursapp.tourslocationslayers.repositories.specs.LayerSpecification;
import com.toursapp.tourslocationslayers.repositories.specs.SpecificationsBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
@RequestMapping("/layer")
public class LayerController {

    @Autowired
    public LayerRepository repository;

    @GetMapping
    List<Layer> getAll() {
        return (List<Layer>) repository.findAll();
    }

    @PostMapping
    Layer save(@RequestBody Layer layer) {
        return repository.save(layer);
    }

    @GetMapping("/{id}")
    Layer getById(@PathVariable Integer id) {
        return repository.findById(id).orElseThrow(() -> new LayerNotFoundException(id));
    }

    @DeleteMapping("/{id}")
    void deleteById(@PathVariable Integer id) {
        repository.deleteById(id);
    }

    public List<Layer> search(@RequestParam(value = "search") String search) {
        SpecificationsBuilder<Layer> builder = new SpecificationsBuilder<>();
        Pattern pattern = Pattern.compile("(\\w+?)([:<>])(\\w+?),");
        Matcher matcher = pattern.matcher(search + ",");
        while (matcher.find()) {
            builder.with(matcher.group(1), matcher.group(2), matcher.group(3));
        }

        Specification<Layer> spec = builder.build(LayerSpecification::new);
        return repository.findAll(spec);
    }
}

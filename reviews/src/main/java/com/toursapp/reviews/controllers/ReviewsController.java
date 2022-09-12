package com.toursapp.reviews.controllers;

import com.toursapp.reviews.entities.Review;
import com.toursapp.reviews.repositories.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reviews")
public class ReviewsController {
    @Autowired
    ReviewRepository repository;

    @GetMapping("/{tour_id}")
    List<Review> getReviewByTourId(@PathVariable Integer tour_id) {
        return repository.findByTourId(tour_id);
    }

    @PostMapping
    void saveReview(Review review) {
        repository.save(review);
    }
}

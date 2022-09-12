package com.toursapp.reviews.repositories;

import com.toursapp.reviews.entities.Review;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ReviewRepository extends CrudRepository<Review, Integer> {
    List<Review> findByTourId(Integer tour_id);
}

package com.toursapp.tourslocationslayers.repositories;

import com.toursapp.tourslocationslayers.entities.Tag;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface TagRepository extends PagingAndSortingRepository<Tag, Integer> {
    Iterable<Tag> findByNameContainingIgnoreCase(String name, Pageable pageable);
}

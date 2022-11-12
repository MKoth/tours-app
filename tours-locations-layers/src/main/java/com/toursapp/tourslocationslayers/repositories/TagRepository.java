package com.toursapp.tourslocationslayers.repositories;

import com.toursapp.tourslocationslayers.entities.Tag;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;
import java.util.Optional;

public interface TagRepository extends PagingAndSortingRepository<Tag, Integer> {
    List<Tag> findByNameContainingIgnoreCase(String name, Pageable pageable);
    Optional<Tag> findByName(String name);
}

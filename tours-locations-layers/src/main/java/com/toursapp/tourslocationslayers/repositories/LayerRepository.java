package com.toursapp.tourslocationslayers.repositories;

import com.toursapp.tourslocationslayers.entities.Layer;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

public interface LayerRepository extends CrudRepository<Layer, Integer>,
        JpaSpecificationExecutor<Layer> {
}

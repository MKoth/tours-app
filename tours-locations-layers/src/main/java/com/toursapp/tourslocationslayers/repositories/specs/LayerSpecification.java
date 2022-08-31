package com.toursapp.tourslocationslayers.repositories.specs;

import com.toursapp.tourslocationslayers.entities.Layer;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class LayerSpecification implements Specification<Layer> {

    private SearchCriteria criteria;

    public LayerSpecification (SearchCriteria criteria){
        this.criteria = criteria;
    }

    @Override
    public Predicate toPredicate(Root<Layer> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        return SpecificationsUtil.getSpecPredicate(criteria, root, builder);
    }
}

package com.toursapp.tourslocationslayers.repositories.specs;

import com.toursapp.tourslocationslayers.entities.Location;
import com.toursapp.tourslocationslayers.entities.Tour;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class TourSpecification  implements Specification<Tour> {

    private SearchCriteria criteria;

    @Override
    public Predicate toPredicate(Root<Tour> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        return SpecificationsUtil.getToursSpecPredicate(criteria, root, builder);
    }
}

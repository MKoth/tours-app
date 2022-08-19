package com.toursapp.tourslocationslayers.repositories.specs;

import com.toursapp.tourslocationslayers.entities.Layer;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class SpecificationsUtil {
    public static <T> Predicate getToursSpecPredicate(SearchCriteria criteria, Root<T> root, CriteriaBuilder builder){
        if (criteria.getKey().equalsIgnoreCase("tags")) {
            List<Predicate> predicates = criteria.getValues().stream()
                    .map((value)->builder.isMember(value, root.get("tags"))).toList();
            return builder.and(predicates.toArray(new Predicate[0]));
        }
        else if (criteria.getOperation().equalsIgnoreCase(">")) {
            return builder.greaterThanOrEqualTo(
                    root.get(criteria.getKey()), criteria.getValue().toString());
        }
        else if (criteria.getOperation().equalsIgnoreCase("<")) {
            return builder.lessThanOrEqualTo(
                    root.get(criteria.getKey()), criteria.getValue().toString());
        }
        else if (criteria.getOperation().equalsIgnoreCase(":")) {
            if (root.get(criteria.getKey()).getJavaType() == String.class) {
                return builder.like(
                        root.get(criteria.getKey()), "%" + criteria.getValue() + "%");
            } else {
                return builder.equal(root.get(criteria.getKey()), criteria.getValue());
            }
        }
        return null;
    }
}

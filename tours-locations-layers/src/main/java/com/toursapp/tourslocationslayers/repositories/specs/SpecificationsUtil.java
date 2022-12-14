package com.toursapp.tourslocationslayers.repositories.specs;

import javax.persistence.criteria.*;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class SpecificationsUtil {
    public static <T> Predicate getSpecPredicate(SearchCriteria criteria, Root<T> root, CriteriaBuilder builder){
//        if (criteria.getKey().equalsIgnoreCase("tags")) {
//            List<Predicate> predicates = criteria.getValues().stream()
//                    .map((value)->builder.isMember(value, root.get("tags"))).toList();
//            return builder.and(predicates.toArray(new Predicate[0]));
//        } else
        if (criteria.getOperation().equalsIgnoreCase(">")) {
            return builder.greaterThanOrEqualTo(
                    root.get(criteria.getKey()).as(Date.class),new Date((Long) criteria.getValue()));
        }
        else if (criteria.getOperation().equalsIgnoreCase("<")) {
            return builder.lessThanOrEqualTo(
                    root.get(criteria.getKey()).as(Date.class), new Date((Long) criteria.getValue()));
        }
        else if (criteria.getOperation().equalsIgnoreCase(":")) {
            if (root.get(criteria.getKey()).getJavaType() == String.class) {
                return builder.like(
                        root.get(criteria.getKey()), "%" + criteria.getValue() + "%");
            } else if (Collection.class.isAssignableFrom(root.get(criteria.getKey()).getJavaType())) {
                var pathToId = root.join(criteria.getKey()).get("id");
                return builder.equal(pathToId, criteria.getValue());
            } else {
                return builder.equal(root.get(criteria.getKey()).get("id"), criteria.getValue());
            }
        }
        return null;
    }
}

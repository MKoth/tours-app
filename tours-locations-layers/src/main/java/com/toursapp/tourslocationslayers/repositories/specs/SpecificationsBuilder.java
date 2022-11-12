package com.toursapp.tourslocationslayers.repositories.specs;

import com.toursapp.tourslocationslayers.entities.Tag;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

public class SpecificationsBuilder<T> {

    private final List<SearchCriteria> params;

    public SpecificationsBuilder() {
        params = new ArrayList<>();
    }

    public SpecificationsBuilder with(String key, String operation, Object value) {
//        if (key == "tags") {
//            List<Tag> tags = Arrays.stream(value.toString().split("\\|"))
//                    .map(Integer::parseInt).map(Tag::new).toList();
//            params.add(new SearchCriteria(key, operation, null, tags));
//        }
//        else {
            if (operation.equalsIgnoreCase("<") || operation.equalsIgnoreCase(">")){
                value = Long.parseLong((String) value);
            }
            params.add(new SearchCriteria(key, operation, value, null));
//        }
        return this;
    }

    public Specification<T> build(Function<SearchCriteria, Specification> specSupplier) {
        if (params.size() == 0) {
            return null;
        }
        List<Specification> specs = null;
        specs = params.stream()
                .map(specSupplier)
                .collect(Collectors.toList());


        Specification result = specs.get(0);

        for (int i = 1; i < params.size(); i++) {
            result = Specification.where(result).and(specs.get(i));
        }
        return result;
    }
}

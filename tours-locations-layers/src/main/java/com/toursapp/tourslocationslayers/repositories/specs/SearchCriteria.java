package com.toursapp.tourslocationslayers.repositories.specs;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.lang.Nullable;

import java.util.List;

@Data
@AllArgsConstructor
public class SearchCriteria {
    private String key;
    private String operation;
    @Nullable
    private Object value;
    @Nullable
    private List<? extends Object> values;
}

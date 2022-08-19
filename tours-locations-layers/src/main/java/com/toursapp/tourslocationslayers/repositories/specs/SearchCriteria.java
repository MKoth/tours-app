package com.toursapp.tourslocationslayers.repositories.specs;

import lombok.Data;

import java.util.List;

@Data
public class SearchCriteria {
    private String key;
    private String operation;
    private Object value;
    private List<Object> values;
}

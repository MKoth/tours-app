package com.toursapp.schedule.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Availability {
    @Id
    private String id;
    private Integer user_id;
    private RecurrenceRule[] rrules;
}

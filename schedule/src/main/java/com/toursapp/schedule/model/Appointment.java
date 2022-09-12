package com.toursapp.schedule.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Document
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Appointment {
    @Id
    private String id;
    private Integer tour_id;
    private Integer user_id;
    private LocalDateTime tour_start;
    private LocalDateTime tour_end;
}

package com.toursapp.tourslocationslayers.entities;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;

    @ManyToMany(mappedBy = "tags")
    private Set<Layer> layers = new HashSet<>();

    @ManyToMany(mappedBy = "tags")
    private Set<Location> locations = new HashSet<>();

    @ManyToMany(mappedBy = "tags")
    private Set<Tour> tours = new HashSet<>();
}

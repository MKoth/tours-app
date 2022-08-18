package com.toursapp.tourslocationslayers.entities;

import lombok.Data;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data
public class Layer {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String name;

    private Float[] points;

    private String text;

    private String image;

    private Date date_added;

    private Date date_updated;

    private Timestamp period_start;

    private Timestamp period_end;

    private Integer creator_id;

    private String city;

    private Boolean enabled;

    private Boolean approved;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "layers_tags",
            joinColumns = @JoinColumn(name = "layer_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "id")
    )
    private Set<Tag> tags = new HashSet<>();

}
package com.toursapp.tourslocationslayers.entities;

import com.toursapp.tourslocationslayers.entities.Enums.TourType;
import lombok.Data;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Data
public class Tour {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String name;

    private Float point;

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

    @Enumerated(EnumType.STRING)
    private TourType type;

    @ManyToOne
    private Layer layer;

    @OneToMany
    @OrderBy("order ASC")
    private List<Location> locations;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "tours_tags",
            joinColumns = @JoinColumn(name = "tour_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "id")
    )
    private Set<Tag> tags = new HashSet<>();
}

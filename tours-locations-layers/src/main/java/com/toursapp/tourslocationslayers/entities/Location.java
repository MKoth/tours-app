package com.toursapp.tourslocationslayers.entities;

import com.toursapp.tourslocationslayers.entities.Enums.LocationType;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Location {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String name;

    private String point;

    private String text;

    private String image;

    private Date date_added;

    private Date date_updated;

    private Timestamp period_start;

    private Timestamp period_end;

    private Integer creator_id;

    @ManyToOne
    private City city;

    private Boolean enabled;

    private Boolean approved;

    private Integer ordering;

    @Enumerated(EnumType.STRING)
    private LocationType type;

    @ManyToOne
    private Layer layer;

    @ManyToOne
    private Tour tour;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "locations_tags",
            joinColumns = @JoinColumn(name = "location_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "id")
    )
    @ToString.Exclude
    private Set<Tag> tags = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Location location = (Location) o;
        return id != null && Objects.equals(id, location.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}

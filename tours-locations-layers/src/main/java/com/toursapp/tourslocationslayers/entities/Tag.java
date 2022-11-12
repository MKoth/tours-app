package com.toursapp.tourslocationslayers.entities;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Tag {
    public Tag(Integer id) {
        this.id = id;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(unique=true)
    private String name;

    @ManyToMany(mappedBy = "tags")
    @ToString.Exclude
    private Set<Layer> layers = new HashSet<>();

    @ManyToMany(mappedBy = "tags")
    @ToString.Exclude
    private Set<Location> locations = new HashSet<>();

    @ManyToMany(mappedBy = "tags")
    @ToString.Exclude
    private Set<Tour> tours = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Tag tag = (Tag) o;
        return id != null && Objects.equals(id, tag.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}

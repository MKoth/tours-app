package com.toursapp.tourslocationslayers.IntegrationSpecifications;

import com.toursapp.tourslocationslayers.entities.Layer;
import com.toursapp.tourslocationslayers.entities.Tag;
import com.toursapp.tourslocationslayers.repositories.LayerRepository;
import com.toursapp.tourslocationslayers.repositories.specs.LayerSpecification;
import com.toursapp.tourslocationslayers.repositories.specs.SearchCriteria;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@ExtendWith(SpringExtension.class)
@DataJpaTest
public class JPASpecificationIntegrationTest {
    @Autowired
    private LayerRepository layerRepository;

    private Layer layer1;
    private Layer layer2;

    private Tag tag1;
    private Tag tag2;
    private Tag tag3;
    private Tag tag4;

    @BeforeEach
    public void init() {
        Set<Tag> tags = new HashSet<>();
        tag1 = new Tag();
        tag1.setName("tag1");
        tag2 = new Tag();
        tag2.setName("tag2");
        tag3 = new Tag();
        tag3.setName("tag3");
        tags.add(tag1);
        tags.add(tag2);
        tags.add(tag3);
        layer1 = new Layer();
        layer1.setName("Test Layer");
        layer1.setPeriod_start(new Timestamp(30000));
        layer1.setPeriod_end(new Timestamp(40000));
        layer1.setTags(tags);
        layerRepository.save(layer1);

        Set<Tag> tags2 = new HashSet<>();
        tag4 = new Tag();
        tag4.setName("tag4");
        tags2.add(tag2);
        tags2.add(tag4);
        layer2 = new Layer();
        layer2.setName("Another Test Layer");
        layer2.setPeriod_start(new Timestamp(35000));
        layer2.setPeriod_end(new Timestamp(80000));
        layer2.setTags(tags2);
        layerRepository.save(layer2);
    }

    @Test
    public void findBothLayersByName() {
        LayerSpecification spec = new LayerSpecification(
                new SearchCriteria("name", ":", "Test Layer", null));
        List<Layer> results = layerRepository.findAll(spec);

        Assertions.assertTrue(results.contains(layer1));
        Assertions.assertTrue(results.contains(layer2));
    }

    @Test
    public void findOnlyLayer2ByName() {
        LayerSpecification spec = new LayerSpecification(
                new SearchCriteria("name", ":", "Another Test Layer", null));
        List<Layer> results = layerRepository.findAll(spec);

        Assertions.assertFalse(results.contains(layer1));
        Assertions.assertTrue(results.contains(layer2));
    }

    @Test
    public void findLayer1ByPeriod() {
        LayerSpecification spec = new LayerSpecification(
                new SearchCriteria("period_start", ">", 32000, null));
        List<Layer> results = layerRepository.findAll(spec);

        Assertions.assertTrue(results.contains(layer2));
        Assertions.assertFalse(results.contains(layer1));
    }

    @Test
    public void findLayer1By2Tags() {
        LayerSpecification spec = new LayerSpecification(
                new SearchCriteria("tags", ":", "", List.of(tag1, tag2)));
        List<Layer> results = layerRepository.findAll(spec);

        Assertions.assertTrue(results.contains(layer1));
        Assertions.assertFalse(results.contains(layer2));
    }

    @Test
    public void findBothLayersByCommonTag() {
        LayerSpecification spec = new LayerSpecification(
                new SearchCriteria("tags", ":", "", List.of(tag2)));
        List<Layer> results = layerRepository.findAll(spec);

        Assertions.assertTrue(results.contains(layer1));
        Assertions.assertTrue(results.contains(layer2));
    }
}

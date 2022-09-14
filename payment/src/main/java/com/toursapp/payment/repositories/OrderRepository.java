package com.toursapp.payment.repositories;

import com.toursapp.payment.entities.Order;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public interface OrderRepository extends CrudRepository<Order, Integer> {
    List<Order> findByDate_addedBetween(Date start, Date end);
}

package com.toursapp.payment.controllers;

import com.toursapp.payment.entities.Order;
import com.toursapp.payment.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping(value = "/orders")
public class OrdersController {
    @Autowired
    OrderRepository repository;

    @GetMapping("/filter/{date_start}/{date_end}")
    List<Order> getOrdersBetween(@PathVariable Date date_start, @PathVariable Date date_end) {
        return repository.findByDate_addedBetween(date_start, date_end);
    }
}

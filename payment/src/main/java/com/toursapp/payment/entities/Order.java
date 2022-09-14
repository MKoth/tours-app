package com.toursapp.payment.entities;

import com.toursapp.payment.entities.enums.OrderStatus;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private double price;
    private String currency;
    private String method;
    private String intent;
    private String description;
    private String paymentId;
    private String payerId;
    private Date date_added;
    private Date date_updated;

    @Enumerated(EnumType.STRING)
    private OrderStatus status;
}

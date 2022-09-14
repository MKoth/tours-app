package com.toursapp.payment.controllers;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.toursapp.payment.entities.Order;
import com.toursapp.payment.entities.enums.OrderStatus;
import com.toursapp.payment.repositories.OrderRepository;
import com.toursapp.payment.service.PaypalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/payment")
public class PaymentController {
    @Autowired
    PaypalService service;

    @Autowired
    OrderRepository repository;

    public static final String SUCCESS_URL = "/payment/pay/success";
    public static final String CANCEL_URL = "/payment/pay/cancel";

    @PostMapping("/pay")
    public Map<String, Object> payment(Order order) {
        Map<String, Object> response = new HashMap<String, Object>();
        Payment payment = null;
        order.setStatus(OrderStatus.IN_PROGRESS);
        order = repository.save(order);
        try {
            payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
                    order.getIntent(), order.getDescription(),
                    "http://localhost:4200/" + CANCEL_URL + "/" + order.getId(),
                    "http://localhost:4200/" + SUCCESS_URL + "/" + order.getId());
            for(Links link:payment.getLinks()) {
                if(link.getRel().equals("approval_url")) {
                    response.put("status", "success");
                    response.put("redirect_url", link.getHref());
                    return response;
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        response.put("status", "payment failure");
        return response;
    }

    @GetMapping("/pay/success/{order_id}")
    Map<String, Object> successPayment(
            @PathVariable Integer order_id,
            @RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId) {
        Map<String, Object> response = new HashMap();
        Order order = repository.findById(order_id).orElseThrow();
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            if (payment.getState().equals("approved")) {
                order.setPaymentId(paymentId);
                order.setPayerId(payerId);
                order.setStatus(OrderStatus.SUCCESS);
                repository.save(order);
                response.put("status", "success");
                response.put("payment", payment);
                return response;
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return response;
    }

    @GetMapping("/pay/cancel/{order_id}")
    Map<String, Object> cancelPayment(@PathVariable Integer order_id) {
        Order order = repository.findById(order_id).orElseThrow();
        order.setStatus(OrderStatus.CANCELED);
        repository.save(order);
        Map<String, Object> response = new HashMap();
        response.put("status", "failure");
        return response;
    }

}

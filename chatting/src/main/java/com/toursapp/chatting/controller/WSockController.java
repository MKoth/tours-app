package com.toursapp.chatting.controller;

import com.toursapp.chatting.constants.KafkaConstants;
import com.toursapp.chatting.model.Message;
import com.toursapp.chatting.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.concurrent.ExecutionException;

@Controller
public class WSockController {
    @Autowired
    private KafkaTemplate<String, Message> kafkaTemplate;

    @MessageMapping("/tour-message")
    public Message recTourMessage(@Payload Message message){
        message.setTimestamp(LocalDateTime.now().toString());
        try {
            kafkaTemplate.send(KafkaConstants.KAFKA_TOPIC, message.getChatId(), message).get();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException(e);
        }
        return message;
    }
}

package com.toursapp.chatting.controller;

import com.toursapp.chatting.constants.KafkaConstants;
import com.toursapp.chatting.model.Message;
import com.toursapp.chatting.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Pageable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("/chat/messages")
public class MessagesController {
    @Autowired
    private KafkaTemplate<String, Message> kafkaTemplate;
    @Autowired
    private MessageRepository repository;

    @GetMapping("/all-messages/{chat_id}")
    public List<Message> getChatHistory(@PathVariable String chat_id, Pageable pageable) {
        return repository.findByChatIdOrderByTimestampDesc(chat_id, pageable);
    }

    @PostMapping("/new")
    @Transactional
    public void addNewMessage(Message message) {
        message.setTimestamp(LocalDateTime.now().toString());
        try {
            repository.save(message);
            kafkaTemplate.send(KafkaConstants.KAFKA_TOPIC, message.getChatId(), message).get();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException(e);
        }
    }
}

package com.toursapp.chatting.repository;

import com.toursapp.chatting.model.Message;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.awt.print.Pageable;
import java.util.List;

public interface MessageRepository extends MongoRepository<Message, String> {
    List<Message> findByChatIdOrderByTimestampDesc(String chatId, Pageable pageable);
}

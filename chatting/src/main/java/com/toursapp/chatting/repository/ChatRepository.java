package com.toursapp.chatting.repository;

import com.toursapp.chatting.model.ChatInfo;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ChatRepository extends MongoRepository<ChatInfo, String> {
}

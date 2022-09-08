package com.toursapp.chatting.controller;

import com.toursapp.chatting.model.ChatInfo;
import com.toursapp.chatting.repository.ChatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chat")
public class ChatsController {
    @Autowired
    private ChatRepository repository;

    @PostMapping("/new")
    public void createNewChat(ChatInfo chatInfo) {
        repository.save(chatInfo);
    }

    @GetMapping("/{chat_id}")
    public ChatInfo getChat(@PathVariable String chat_id) {
        return repository.findById(chat_id).orElseThrow(() -> new RuntimeException("Not found"));
    }
}

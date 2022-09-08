package com.toursapp.chatting.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class ChatInfo {
    @Id
    private String id;
    private Integer tour_id;
    private Integer tour_owner_id;
    private String getTour_owner_name;
    private Integer client_id;
    private String client_name;
}

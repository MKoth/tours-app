package com.toursapp.chatting.model;

import lombok.*;
import org.apache.kafka.common.protocol.types.Field;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Document
public class Message {
    @Id
    private String id;
    private String chatId;
    private String senderName;
    private Integer senderId;
    private String receiverName;
    private Integer receiverId;
    private String message;
    private String timestamp;
    private MessageStatus status;
}

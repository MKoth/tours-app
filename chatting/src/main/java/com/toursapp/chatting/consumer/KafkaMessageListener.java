package com.toursapp.chatting.consumer;

import com.toursapp.chatting.constants.KafkaConstants;
import com.toursapp.chatting.model.Message;
import com.toursapp.chatting.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

@Component
public class KafkaMessageListener {
    @Autowired
    SimpMessagingTemplate template;
    @Autowired
    private MessageRepository repository;

    @KafkaListener(
            topics = KafkaConstants.KAFKA_TOPIC,
            groupId = KafkaConstants.GROUP_ID
    )
    public void listen(Message message) {
        System.out.println("sending via kafka listener..");
        System.out.println("/tour/"+message.getChatId()+"/"+message.getReceiverName());
        repository.save(message);
        template.convertAndSend("/tour/"+message.getChatId()+"/"+message.getReceiverName(), message);
    }
}

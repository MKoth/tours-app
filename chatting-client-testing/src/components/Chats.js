import React, { useEffect, useState } from 'react'
import {over} from 'stompjs';
import SockJS from 'sockjs-client';

var stompClient =null;
const Chats = () => {
    const connect =()=>{
        let Sock = new SockJS('http://localhost:8080/ws');
        stompClient = over(Sock);
        stompClient.connect({},onConnected, onError);
    }
    const onConnected = () => {
        setUserData({...userData,"connected": true});
    }

    const onError = (e) => {
        console.log(e);
    }

    const [userData, setUserData] = useState({
        username: '',
        connected: false
    });
    
    const [chat, setChat] = useState({
        chatName: '',
        receiverName: '',
        messages: [],
        connected: false
    });

    const [newMessage, setNewMessage] = useState({
        date: '',
        senderName: '',
        receiverName: '',
        message: '',
        chatId: ''
    });
    
    const handleUsername=(event)=>{
        const {value}=event.target;
        setUserData({...userData,"username": value});
    }

    const handleChatName=(event)=>{
        const {value}=event.target;
        setChat({...chat,"chatName": value});
    }

    const handleChatReceiver=(event)=>{
        const {value}=event.target;
        setChat({...chat,"receiverName": value});
    }

    const handleNewMessage=(event)=>{
        const {value}=event.target;
        setNewMessage({...newMessage,
            "message": value, "senderName": userData.username, 
            "chatId": chat.chatName, "receiverName": chat.receiverName})
    }
    
    const registerUser=()=>{
        connect();
    }

    const connectToChat=()=>{
        console.log("subscribed");
        setChat({...chat,"connected": true});
        stompClient.subscribe("/tour/"+chat.chatName+"/"+userData.username, onMessageReceived);
    }

    const onMessageReceived = (payload)=>{
        var payloadData = JSON.parse(payload.body);
        chat.messages.push(payloadData);
        console.log(chat);
        setChat({...chat,"connected": true});
    }

    const sendMessage = ()=>{
        stompClient.send("/app/tour-message", {}, JSON.stringify(newMessage));
        setNewMessage({...newMessage, message: ""})
    }
    
    return (<div>
        {userData.connected?
            <div className="chat-box">
                {!chat.connected? <div>
                    <input
                        id="chat-name"
                        placeholder="Enter chat name to listen"
                        name="chatName"
                        value={chat.chatName}
                        onChange={handleChatName}
                        margin="normal"
                    />
                    <input
                        id="receiver-name"
                        placeholder="Enter receiver name for this chat"
                        name="chatName"
                        value={chat.chatReceiver}
                        onChange={handleChatReceiver}
                        margin="normal"
                    />
                    <button type="button" onClick={connectToChat} 
                        disabled={chat.chatName==''||chat.receiverName==''}>
                        Connect to chat
                    </button>
                </div>:
                <div>
                    <div>

                        <ul className="chat-messages">
                            {chat.messages.map((message,index)=>(
                                <li key={index}>
                                    <div><b>From: {message.senderName}</b></div><br/>
                                    <div>{message.message}</div><br/>
                                </li>
                            ))}
                        </ul>

                    </div>
                    <input
                        id="new-message"
                        placeholder="Enter your message"
                        name="message"
                        value={newMessage.message}
                        onChange={handleNewMessage}
                        margin="normal"
                    />
                    <button type="button" onClick={sendMessage}>
                        Send message
                    </button>
                </div>}
            </div>
            :
            <div className="register">
                <input
                    id="user-name"
                    placeholder="Enter your name"
                    name="userName"
                    value={userData.username}
                    onChange={handleUsername}
                    margin="normal"
                />
                <button type="button" onClick={registerUser}>
                    Connect as user
                </button> 
            </div>
        }
    </div>)
}



export default Chats;
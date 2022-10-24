package com.toursapp.usersmanager.controllers;

import com.toursapp.usersmanager.dto.UserDTO;
import com.toursapp.usersmanager.service.KeyCloakService;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("users-manager/user")
public class KeyCloakController {
    @Autowired
    KeyCloakService service;

    @PostMapping
    public ResponseEntity addUser(@RequestBody UserDTO userDTO){
        try {
            service.addUser(userDTO);
        } catch (WebApplicationException ex) {
            if (ex.getMessage().contains("Code: 409")) {
                return new ResponseEntity(Map.of("error", "User already exists"), HttpStatus.CONFLICT);
            }
        }
        return new ResponseEntity(Map.of("msg", "User successfully created"), HttpStatus.CREATED);
    }

    @GetMapping("/{userName}")
    public List<UserRepresentation> getUser(@PathVariable("userName") String userName){
        List<UserRepresentation> user = service.getUser(userName);
        return user;
    }

    @PutMapping(path = "/update/{userId}")
    public String updateUser(@PathVariable("userId") String userId,   @RequestBody UserDTO userDTO){
        service.updateUser(userId, userDTO);
        return "User Details Updated Successfully.";
    }

    @DeleteMapping("/{userId}")
    public String deleteUser(@PathVariable("userId") String userId){
        service.deleteUser(userId);
        return "User Deleted Successfully.";
    }

    @GetMapping("/verification-link/{userId}")
    public String sendVerificationLink(@PathVariable("userId") String userId){
        service.sendVerificationLink(userId);
        return "Verification Link Send to Registered E-mail Id.";
    }

    @GetMapping("/reset-password/{userId}")
    public String sendResetPassword(@PathVariable("userId") String userId){
        service.sendResetPassword(userId);
        return "Reset Password Link Send Successfully to Registered E-mail Id.";
    }
}

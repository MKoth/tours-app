package com.toursapp.usersmanager.service;

import com.toursapp.usersmanager.config.KeycloakConfig;
import com.toursapp.usersmanager.config.KeycloakConfigProperties;
import com.toursapp.usersmanager.dto.UserDTO;
import com.toursapp.usersmanager.utils.Credentials;
import org.keycloak.admin.client.CreatedResponseUtil;
import org.keycloak.admin.client.resource.RolesResource;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.ws.rs.core.Response;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service
public class KeyCloakService {

    @Autowired
    KeycloakConfigProperties keycloakConfigProps;

    public void addUser(UserDTO userDTO){
        CredentialRepresentation credential = Credentials
                .createPasswordCredentials(userDTO.getPassword());
        UserRepresentation user = new UserRepresentation();
        user.setUsername(userDTO.getUserName());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setEmail(userDTO.getEmailId());
        user.setCredentials(Collections.singletonList(credential));

        user.setEnabled(true);

        UsersResource instance = getInstance();
        var newUser = instance.create(user);
        String userId = CreatedResponseUtil.getCreatedId(newUser);
        UserResource userResource = instance.get(userId);

        var userRealmRole = getRolesInstance().get("USER").toRepresentation();
        userResource.roles().realmLevel() //
                .add(Arrays.asList(userRealmRole));
    }

    public void assignCreatorRole(String userId) {
        UsersResource instance = getInstance();
        UserResource userResource = instance.get(userId);
        var userRealmRole = getRolesInstance().get("USER").toRepresentation();
        var creatorRealmRole = getRolesInstance().get("CREATOR").toRepresentation();
        userResource.roles().realmLevel().remove(Arrays.asList(userRealmRole));
        userResource.roles().realmLevel().add(Arrays.asList(creatorRealmRole));
    }

    public List<UserRepresentation> getUser(String userName){
        UsersResource usersResource = getInstance();
        List<UserRepresentation> user = usersResource.search(userName, true);
        return user;

    }

    public void updateProfileImage(String userId, String imageUrl) {
        UserResource userResource = getInstance().get(userId);
        UserRepresentation user = userResource.toRepresentation();
        user.setAttributes(Map.of("profile-image", List.of(imageUrl)));
        userResource.update(user);
    }

    public void updateUser(String userId, UserDTO userDTO){
        CredentialRepresentation credential = Credentials
                .createPasswordCredentials(userDTO.getPassword());
        UserRepresentation user = new UserRepresentation();
        user.setUsername(userDTO.getUserName());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setEmail(userDTO.getEmailId());
        user.setCredentials(Collections.singletonList(credential));

        UsersResource usersResource = getInstance();
        usersResource.get(userId).update(user);
    }
    public void deleteUser(String userId){
        UsersResource usersResource = getInstance();
        usersResource.get(userId)
                .remove();
    }


    public void sendVerificationLink(String userId){
        UsersResource usersResource = getInstance();
        usersResource.get(userId)
                .sendVerifyEmail();
    }

    public void sendResetPassword(String userId){
        UsersResource usersResource = getInstance();

        usersResource.get(userId)
                .executeActionsEmail(Arrays.asList("UPDATE_PASSWORD"));
    }

    public UsersResource getInstance(){
        return KeycloakConfig.getInstance(keycloakConfigProps)
                .realm(keycloakConfigProps.getRealm())
                .users();
    }

    public RolesResource getRolesInstance(){
        return KeycloakConfig.getInstance(keycloakConfigProps)
                .realm(keycloakConfigProps.getRealm())
                .roles();
    }
}

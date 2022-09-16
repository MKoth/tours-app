package com.toursapp.usersmanager.config;

import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;

public class KeycloakConfig {

    static Keycloak keycloak = null;

    public KeycloakConfig() {
    }

    public static Keycloak getInstance(KeycloakConfigProperties props){
        if(keycloak == null){

            keycloak = KeycloakBuilder.builder()
                    .serverUrl(props.getServerUrl())
                    .realm(props.getRealm())
                    .grantType(OAuth2Constants.PASSWORD)
                    .username(props.getUserName())
                    .password(props.getPassword())
                    .clientId(props.getClientId())
                    //.clientSecret(props.getClientSecret())
                    .resteasyClient(new ResteasyClientBuilder()
                            .connectionPoolSize(10)
                            .build()
                    )
                    .build();
        }
        return keycloak;
    }
}

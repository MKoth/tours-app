package com.toursapp.usersmanager.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@Getter
@PropertySource("classpath:keycloak-client.properties")
public class KeycloakConfigProperties {
    @Value("${server.url}")
    private String serverUrl;
    @Value("${realm.name}")
    private String realm;
    @Value("${client.id}")
    private String clientId;
    @Value("${client.secret}")
    private String clientSecret;
    @Value("${admin.name}")
    private String userName;
    @Value("${admin.password}")
    private String password;
}

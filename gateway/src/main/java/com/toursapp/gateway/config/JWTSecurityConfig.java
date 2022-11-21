package com.toursapp.gateway.config;

import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.gateway.config.GlobalCorsProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.ReactiveJwtAuthenticationConverterAdapter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.web.cors.reactive.CorsConfigurationSource;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import reactor.core.publisher.Mono;

@Configuration
public class JWTSecurityConfig {
    @Bean
    public SecurityWebFilterChain filterChain(ServerHttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeExchange()
                .pathMatchers(HttpMethod.GET ,"/users-manager/user/assignCreatorRole/*").hasRole("USER")
                .pathMatchers(HttpMethod.GET ,"/users-manager/user/*").permitAll()
                .pathMatchers(HttpMethod.POST ,"/users-manager/user").permitAll()
                .pathMatchers(HttpMethod.GET ,"/files-uploader/**").permitAll()
                .pathMatchers(HttpMethod.GET ,"/tours-locations-layers/**").permitAll()
                .pathMatchers(HttpMethod.POST ,"/tours-locations-layers/**").hasAnyRole("CREATOR", "ADMIN")
                .pathMatchers(HttpMethod.PUT ,"/tours-locations-layers/**").hasAnyRole("CREATOR", "ADMIN")
                .pathMatchers(HttpMethod.DELETE ,"/tours-locations-layers/**").hasAnyRole("CREATOR", "ADMIN")
                .anyExchange().authenticated().and()
                .oauth2ResourceServer(oauth2ResourceServer -> oauth2ResourceServer.jwt(
                        jwt -> jwt.jwtAuthenticationConverter( grantedAuthoritiesExtractor())));
        return http.cors().and().build();
    }

    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    @RefreshScope
    public CorsWebFilter corsWebFilter(CorsConfigurationSource corsConfigurationSource) {
        return new CorsWebFilter(corsConfigurationSource);
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource(GlobalCorsProperties globalCorsProperties) {
        var source = new UrlBasedCorsConfigurationSource();
        globalCorsProperties.getCorsConfigurations().forEach(source::registerCorsConfiguration);
        return source;
    }

    Converter<Jwt, Mono<AbstractAuthenticationToken>> grantedAuthoritiesExtractor() {
        JwtAuthenticationConverter jwtAuthenticationConverter =
                new JwtAuthenticationConverter();
        jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter
                (new KeycloakRealmRoleExtractor());
        return new ReactiveJwtAuthenticationConverterAdapter(jwtAuthenticationConverter);
    }
}

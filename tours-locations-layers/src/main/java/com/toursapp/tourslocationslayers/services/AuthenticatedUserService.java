package com.toursapp.tourslocationslayers.services;

import com.toursapp.tourslocationslayers.entities.Layer;
import com.toursapp.tourslocationslayers.entities.Location;
import com.toursapp.tourslocationslayers.entities.Tour;
import com.toursapp.tourslocationslayers.repositories.LayerRepository;
import com.toursapp.tourslocationslayers.repositories.LocationRepository;
import com.toursapp.tourslocationslayers.repositories.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AuthenticatedUserService {
    private static final String CREATOR_ROLE = "CREATOR";
    private static final String ADMIN_ROLE = "ADMIN";

    @Autowired
    TourRepository tourRepository;

    @Autowired
    LocationRepository locationRepository;

    @Autowired
    LayerRepository layerRepository;

    private String getUserId() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    private List<String> getUserRoles() {
        var principal = (Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        final Map<String, Object> realmAccess = (Map<String, Object>) principal.getClaims().get("realm_access");
        return (List<String>) realmAccess.get("roles");
    }

    public boolean canUserEditItem(String creator_id) {
        String user_id = getUserId();
        return (getUserRoles()).stream().anyMatch(role->
                role.equalsIgnoreCase(ADMIN_ROLE) || (role.equalsIgnoreCase(CREATOR_ROLE) && user_id.equals(creator_id)));
    }

    public boolean canUserDeleteTour(Integer id) {
        Tour tour = tourRepository.findById(id).orElseThrow();
        return canUserEditItem(tour.getCreator_id());
    }

    public boolean canUserDeleteLayer(Integer id) {
        Layer layer = layerRepository.findById(id).orElseThrow();
        return canUserEditItem(layer.getCreator_id());
    }

    public boolean canUserDeleteLocation(Integer id) {
        Location location = locationRepository.findById(id).orElseThrow();
        return canUserEditItem(location.getCreator_id());
    }
}

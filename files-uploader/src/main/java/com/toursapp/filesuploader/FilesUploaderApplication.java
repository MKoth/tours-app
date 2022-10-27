package com.toursapp.filesuploader;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import com.netflix.discovery.shared.resolver.EurekaEndpoint;

@SpringBootApplication
@EnableEurekaClient
public class FilesUploaderApplication {

	public static void main(String[] args) {
		SpringApplication.run(FilesUploaderApplication.class, args);
	}

}

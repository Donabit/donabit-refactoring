package com.donabit.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class DonabitApplication {

	public static void main(String[] args) {
		SpringApplication.run(DonabitApplication.class, args);
	}

}

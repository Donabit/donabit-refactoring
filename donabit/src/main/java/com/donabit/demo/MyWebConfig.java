package com.donabit.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration 
public class MyWebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry
		.addResourceHandler("/image/**") //아래의 경로를 부를때 사용
		.addResourceLocations("file:\\C:\\Users\\YooSeungAh\\Desktop\\ai_images\\"); //경로지정
		
		registry
		.addResourceHandler("/checkimage/**") //아래의 경로를 부를때 사용
		.addResourceLocations("file:/C:/checkimage/"); //경로지정
		
		registry
		.addResourceHandler("/images/**") //아래의 경로를 부를때 사용
		.addResourceLocations("file:\\C:\\Users\\YooSeungAh\\Desktop\\ai_images\\"); //경로지정
		
	}

}

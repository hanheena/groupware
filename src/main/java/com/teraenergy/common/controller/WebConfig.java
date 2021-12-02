package com.teraenergy.common.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
//@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

	  @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	                .addResourceHandler("/file_path/**")
	                .addResourceLocations("file:///c:/file_path/");
	    }
	}
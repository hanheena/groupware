package com.teraenergy.common.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.teraenergy.common.interceptor.LoginInterceptor;

@Configuration
//@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

	  @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	                .addResourceHandler("/file_path/**")
	                .addResourceLocations("file:///c:/file_path/");
	    }
	  

		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new LoginInterceptor())
			.addPathPatterns("/teware/dashboard");
		}
	}
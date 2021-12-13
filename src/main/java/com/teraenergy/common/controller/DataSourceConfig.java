package com.teraenergy.common.controller;

import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Primary;

@Configuration
public class DataSourceConfig {

	// @ConfigurationProperties : 프로퍼티 설절파일을 읽어들이는 어노테이션
	// application.properties의 설정한 커스텀데이터소스 설정부분을 prefix의 값으로 설정한다.
	
	@Bean(name = "commonDataSource")
	@ConfigurationProperties("spring.datasource.hikari.common")
	public DataSource commonDataSource() {
		return DataSourceBuilder.create().type(HikariDataSource.class).build();
	}

	@Bean(name = "local1DataSource")
	@ConfigurationProperties("spring.datasource.hikari.local1")
	public DataSource local1DataSource() {
		return DataSourceBuilder.create().type(HikariDataSource.class).build();
	}
}

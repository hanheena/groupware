package com.teraenergy.common.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan(basePackages = "com.teraenergy.dashboard.mapper", sqlSessionFactoryRef = "local1SqlSessionFactory")
@EnableTransactionManagement
public class LocalDBConfig {

	@Bean(name = "local1DataSource")
//	@Primary
	@ConfigurationProperties(prefix = "spring.datasource.hikari.local1")
	public DataSource local1DataSource() {

		// application.properties에서 정의한 DB 연결 정보를 빌드
		return DataSourceBuilder.create().type(HikariDataSource.class).build();
	}

	@Bean(name = "local1SqlSessionFactory")
//	@Primary
	public SqlSessionFactory local1SqlSessionFactory(@Qualifier("local1DataSource") DataSource local1DataSource,
			ApplicationContext applicationContext) throws Exception {

		// 세션 생성 시, 빌드된 DataSource를 세팅하고 SQL문을 관리할 mapper.xml의 경로를 알려준다.
		final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();

		sqlSessionFactoryBean.setDataSource(local1DataSource);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mapper/dashboard/*DB.xml"));
		return sqlSessionFactoryBean.getObject();
	}

	@Bean(name = "local1SqlSessionTemplate")
//	@Primary
	public SqlSessionTemplate local1SqlSessionTemplate(SqlSessionFactory local1SqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(local1SqlSessionFactory);
	}

	@Bean(name = "local1transactionManager")
//	@Primary
	public PlatformTransactionManager local1transactionManager(
			@Qualifier("local1DataSource") DataSource local1DataSource) {
		return new DataSourceTransactionManager(local1DataSource);
	}
}

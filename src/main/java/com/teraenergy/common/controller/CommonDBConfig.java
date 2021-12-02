/*
 * package com.teraenergy.common.controller;
 * 
 * import javax.sql.DataSource;
 * 
 * import org.apache.ibatis.session.SqlSessionFactory; import
 * org.mybatis.spring.SqlSessionFactoryBean; import
 * org.mybatis.spring.SqlSessionTemplate; import
 * org.mybatis.spring.annotation.MapperScan; import
 * org.springframework.beans.factory.annotation.Qualifier; import
 * org.springframework.boot.context.properties.ConfigurationProperties; import
 * org.springframework.boot.jdbc.DataSourceBuilder; import
 * org.springframework.context.ApplicationContext; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.jdbc.datasource.DataSourceTransactionManager; import
 * org.springframework.transaction.PlatformTransactionManager; import
 * org.springframework.transaction.annotation.EnableTransactionManagement;
 * 
 * @Configuration
 * 
 * @MapperScan(basePackages="com.teraenergy.common.mapper", sqlSessionFactoryRef
 * = "commonSqlSessionFactory")
 * 
 * @EnableTransactionManagement public class CommonDBConfig {
 * 
 * @Bean(name = "commonDataSource")
 * 
 * @ConfigurationProperties(prefix = "spring.datasource-common") public
 * DataSource commonDataSource() {
 * 
 * // application.properties에서 정의한 DB 연결 정보를 빌드 return
 * DataSourceBuilder.create().build(); }
 * 
 * @Bean(name = "commonSqlSessionFactory") public SqlSessionFactory
 * commonSqlSessionFactory(@Qualifier("commonDataSource") DataSource
 * commonDataSource, ApplicationContext applicationContext) throws Exception {
 * 
 * // 세션 생성 시, 빌드된 DataSource를 세팅하고 SQL문을 관리할 mapper.xml의 경로를 알려준다. final
 * SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
 * 
 * sqlSessionFactoryBean.setDataSource(commonDataSource);
 * sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources(
 * "classpath:mapper/common/*DB.xml")); return
 * sqlSessionFactoryBean.getObject(); }
 * 
 * @Bean(name = "commonSqlSessionTemplate") public SqlSessionTemplate
 * commonSqlSessionTemplate(SqlSessionFactory commonSqlSessionFactory) throws
 * Exception { return new SqlSessionTemplate(commonSqlSessionFactory); }
 * 
 * @Bean(name = "commontransactionManager") public PlatformTransactionManager
 * commontransactionManager(
 * 
 * @Qualifier("commonDataSource") DataSource commonDataSource) { return new
 * DataSourceTransactionManager(commonDataSource); } }
 */
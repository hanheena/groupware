package com.teraenergy.common.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
 
import javax.sql.DataSource;

@Configuration
public class MybatisConfig {
	
	@Autowired
    @Qualifier(value = "commonDataSource")
    private DataSource commonDataSource;
 
    @Autowired
    @Qualifier(value = "local1DataSource")
    private DataSource local1DataSource;
 
    @Bean(name = "commonSqlSessionFactory")
    public SqlSessionFactory commonSqlSessionFactory(DataSource commonDataSource, ApplicationContext applicationContext) throws Exception {
    	
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        
        sqlSessionFactoryBean.setDataSource(commonDataSource);
        
        /* 맵퍼 xml 파일 경로 설정 */
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mapper/common/*DB.xml"));
 
        return sqlSessionFactoryBean.getObject();
    }
 
    @Bean(name = "local1SqlSessionFactory")
//    @Primary
    public SqlSessionFactory local1SqlSessionFactory(DataSource local1DataSource, ApplicationContext applicationContext) throws Exception {
    	
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        
        sqlSessionFactoryBean.setDataSource(local1DataSource);
        
        /* 맵퍼 xml 파일 경로 설정 */
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mapper/dashboard/*DB.xml"));
 
        return sqlSessionFactoryBean.getObject();
    }
 
    @Bean
    public SqlSession commonSqlSession(SqlSessionFactory commonSqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(commonSqlSessionFactory);
    }
 
    @Bean
//    @Primary
    public SqlSession local1SqlSession(SqlSessionFactory local1SqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(local1SqlSessionFactory);
    }
}

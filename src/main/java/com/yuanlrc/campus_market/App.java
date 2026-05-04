package com.yuanlrc.campus_market;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * 项目入口启动文件
 * 用户入口：http://localhost:8080/home/index/index
 *后台入口：http://localhost:8080/admin
 */
@SpringBootApplication
@EnableJpaAuditing
@ServletComponentScan
public class App
{
    public static void main( String[] args )
    {
    	 SpringApplication.run(App.class, args);
    }
}

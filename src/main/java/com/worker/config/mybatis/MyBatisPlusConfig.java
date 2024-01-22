package com.worker.config.mybatis;


import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatisPlus配置
 * @author HP-PC
 */
@Configuration
public class MyBatisPlusConfig {

    /**
     * MybatisPlus插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        PaginationInnerInterceptor paginationInnerInterceptor =
                new PaginationInnerInterceptor(DbType.MYSQL);
        // 溢出后从第1页开始
        paginationInnerInterceptor.setOverflow(true);
        // 指定数据库类型
        interceptor.addInnerInterceptor(paginationInnerInterceptor);
        return interceptor;
    }

}
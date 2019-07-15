package com.etc.security;

import com.etc.service.AdminUserDatailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    PasswordEncoder passwordEncoder;
    @Bean
    UserDetailsService adminDetailService(){return new AdminUserDatailService(); }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //user Details Service验证
        auth.userDetailsService(adminDetailService()).passwordEncoder(passwordEncoder);
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception{
        //关闭跨域请求伪造防护
        String[] paths={"/css/**","/js/**","/fonts/**","/images/**","/dataTables/**","/font-awesome/**","/part/**","/register"};
        http.cors().and().csrf().disable().authorizeRequests()
                .antMatchers(paths).permitAll()
                //任何请求,登录后可以访问
                .anyRequest().authenticated()
//                登录
                .and().
                formLogin()
                //登录页面以及登录行为的url
                .loginPage("/login").loginProcessingUrl("/login")
                //登录成功后的跳转
                .defaultSuccessUrl("/")
                .failureUrl("/login?error")
                //用户名和密码参数名
                .passwordParameter("password").usernameParameter("username")
                .permitAll()
//                登出操作
                .and()
                .logout().permitAll().deleteCookies("JSESSIONID")
                //注销行为任意访问
                .invalidateHttpSession(true);
    }
}
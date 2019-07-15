package com.etc.service;

import com.etc.model.entity.Admin;
import com.etc.security.CustomPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class AdminUserDatailService implements UserDetailsService {
    @Autowired
    AdminService adminService;
    //PasswordEncoder会在这里进行隐式实现
    @Autowired
    CustomPasswordEncoder passwordEncoder;
    //自定义实现用户名查找方法
    @Override
    public UserDetails loadUserByUsername(String username){
        //上篇提到的根据用户名返回用户信息
        Admin admin=adminService.getAdminByName(username);
        //加密
        String password = passwordEncoder.encode(admin.getPassword());
        //用户不存在报错
        if(admin == null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        //返回user对象的用户名和密码，判断由security的内部方法自动实现，只有管理员一种用户，直接授权即可
        return new org.springframework.security.core.userdetails.User(
                admin.getUsername(),admin.getPassword(),
                AuthorityUtils.commaSeparatedStringToAuthorityList("admin"));
    }
}

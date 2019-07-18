package com.etc.controller;

import com.etc.model.dao.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

    private AdminMapper adminMapper;

    public AdminMapper getAdminMapper() {
        return adminMapper;
    }

    @Autowired
    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @RequestMapping("/")
    public String home(){
        return "predict";
    }

    @GetMapping("/login")
    public String tologin(){
        return "login";
    }



//    @PostMapping("/login")
//    public void login(){
//        System.out.println("for test");
//    }

    @GetMapping("/error")
    public String error(){
        return "error";
    }
}

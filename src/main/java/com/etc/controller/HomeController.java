package com.etc.controller;

import com.etc.model.dao.AdminMapper;
import com.etc.util.FlightAnalyzer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

    @Autowired
    private AdminMapper adminMapper;


    @RequestMapping("/")
    public String home() throws Exception {
        //FlightAnalyzer.toPython("WJ5728","HIA","B737");
        return "flight";
    }

    @GetMapping("/login")
    public String tologin(){
        return "login";
    }


    @GetMapping("/predict")
    public String toPredict(){
        return "predict";
    }

    @GetMapping("/map")
    public String toMap(){
        return "map";
    }

    @GetMapping("/error")
    public String error(){
        return "error";
    }
}

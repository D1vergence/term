package com.etc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticalController {


    @GetMapping("/statistical")
    public String toStatical(){
        return "statistical";
    }
}

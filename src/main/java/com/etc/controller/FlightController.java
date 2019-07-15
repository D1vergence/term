package com.etc.controller;

import com.etc.model.dao.FlightInfoMapper;
import com.etc.model.dao.FlightMapper;
import com.etc.model.entity.Flight;
import com.etc.model.entity.FlightInfo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class FlightController {
    @Autowired
    private FlightInfoMapper flightInfoMapper;

    @GetMapping("/flight")
    public String getFlight(Model model){
        model.addAttribute("list",flightInfoMapper.selectByExample(null));
        return "flight";
    }

    @GetMapping("/")
    public String indexGetFlight(Model model){
        model.addAttribute("list",flightInfoMapper.selectByExample(null));
        return "index";
    }

    @ResponseBody
    @GetMapping("/flightInfo/page/{pageNum}")
    public List<FlightInfo> getPartFlight(@PathVariable Integer pageNum){
        PageHelper.startPage(pageNum,15);
        return flightInfoMapper.selectByExample(null);
    }
}

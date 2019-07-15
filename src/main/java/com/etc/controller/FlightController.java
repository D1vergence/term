package com.etc.controller;

import com.etc.model.dao.FlightMapper;
import com.etc.model.entity.Flight;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class FlightController {
    @Autowired
    private FlightMapper flightMapper;

    @ResponseBody
    @GetMapping("/flightInfo/page/{pageNum}")
    public List<Flight> getPartFlight(@PathVariable Integer pageNum){
        PageHelper.startPage(pageNum,15);
        return flightMapper.selectByExample(null);
    }
}

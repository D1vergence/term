package com.etc.controller;

import com.etc.model.dao.FlightInfoMapper;
import com.etc.model.dao.FlightMapper;
import com.etc.model.dao.FunctionalMapper;
import com.etc.model.entity.Flight;
import com.etc.model.entity.FlightInfo;
import com.etc.util.DataTableResultInfo;
import com.etc.util.FlightAnalyzer;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.PageData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FlightController {
    @Autowired
    private FlightInfoMapper flightInfoMapper;
    @Autowired
    private FunctionalMapper functionalMapper;

    @GetMapping("/flight")
    public String getFlight(Model model){
        model.addAttribute("list",flightInfoMapper.selectByExample(null));
        return "flight";
    }

    @GetMapping("/showflight")
    public String flight(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
        PageHelper.startPage(pn,30);
        List<FlightInfo> flightInfo=flightInfoMapper.selectByExample(null);
        model.addAttribute("pageInfo",new PageInfo<>(flightInfo,30));
        return "flight";
    }

    @ResponseBody
    @GetMapping("/flightList")
    public DataTableResultInfo getFlightList(
            @RequestParam(value = "start", required = false, defaultValue="0") Integer start,
            @RequestParam(value = "length", required = false, defaultValue="30") Integer length,
            @RequestParam(value = "draw",required = false,defaultValue = "0") Integer draw
    ){
        int pageNo = (start)/length+1;
        PageHelper.startPage(pageNo,length);
        Page<FlightInfo> pageInfo = functionalMapper.findByPage();

        DataTableResultInfo dataTableResultInfo = new DataTableResultInfo();
        dataTableResultInfo.setData(pageInfo);
        dataTableResultInfo.setDraw(draw);
        dataTableResultInfo.setLength(length);
        dataTableResultInfo.setRecordsTotal(pageInfo.getTotal());
        dataTableResultInfo.setRecordsFiltered(pageInfo.getTotal());

        return dataTableResultInfo;
    }

    @ResponseBody
    @GetMapping("/flightList/{info}")
    public DataTableResultInfo search(
            @RequestParam(value = "start", required = false, defaultValue="0") Integer start,
            @RequestParam(value = "length", required = false, defaultValue="30") Integer length,
            @RequestParam(value = "draw",required = false,defaultValue = "0") Integer draw,
            @PathVariable String info
    ){
        int pageNo = (start)/length+1;
        PageHelper.startPage(pageNo,length);
        Page<FlightInfo> pageInfo = functionalMapper.search(info);

        DataTableResultInfo dataTableResultInfo = new DataTableResultInfo();
        dataTableResultInfo.setData(pageInfo);
        dataTableResultInfo.setDraw(draw);
        dataTableResultInfo.setLength(length);
        dataTableResultInfo.setRecordsTotal(pageInfo.getTotal());
        dataTableResultInfo.setRecordsFiltered(pageInfo.getTotal());


        return dataTableResultInfo;
    }


    @ResponseBody
    @GetMapping("/getFno")
    public List<String> getFno(){
        return functionalMapper.getFno();
    }

    @ResponseBody
    @GetMapping("/getPtype")
    public List<String> getPtype(){
        return functionalMapper.getPtype();
    }

    @ResponseBody
    @GetMapping("/getArrival")
    public List<FlightInfo> getArrival(){
        return functionalMapper.getArrival();
    }

    @ResponseBody
    @PostMapping("/predict")
    public String predict(String fno,String ptype,String arrival,String temperature,String weather,String visible) throws Exception {
        return FlightAnalyzer.toPython(fno,ptype,arrival,temperature,weather,visible)+"";
    }
}

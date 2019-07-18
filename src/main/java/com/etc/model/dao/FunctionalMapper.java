package com.etc.model.dao;

import com.etc.model.entity.FlightInfo;
import com.github.pagehelper.Page;

import java.util.List;

public interface FunctionalMapper {
    Page<FlightInfo> findByPage();
    Page<FlightInfo> search(String info);
    List<String> getFno();
    List<String> getPtype();
    List<FlightInfo> getArrival();
}

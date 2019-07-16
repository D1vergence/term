package com.etc.model.dao;

import com.etc.model.entity.FlightInfo;
import com.github.pagehelper.Page;

public interface FunctionalMapper {
    Page<FlightInfo> findByPage();
    Page<FlightInfo> search(String info);
}

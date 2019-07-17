package com.etc.model.dao;

import com.etc.model.entity.FlightInfo;
import com.etc.model.entity.FlightInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlightInfoMapper {
    int countByExample(FlightInfoExample example);

    int deleteByExample(FlightInfoExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(FlightInfo record);

    int insertSelective(FlightInfo record);

    List<FlightInfo> selectByExample(FlightInfoExample example);

    FlightInfo selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") FlightInfo record, @Param("example") FlightInfoExample example);

    int updateByExample(@Param("record") FlightInfo record, @Param("example") FlightInfoExample example);

    int updateByPrimaryKeySelective(FlightInfo record);

    int updateByPrimaryKey(FlightInfo record);
}
package com.etc.util;

import com.etc.model.entity.FlightInfo;
import com.github.pagehelper.Page;

public class DataTableResultInfo {
    private Page<FlightInfo> data;
    private int draw;//the NO.of requests
    private int length;
    private long recordsTotal;
    private long recordsFiltered;

    public Page<FlightInfo> getData() {
        return data;
    }

    public void setData(Page<FlightInfo> data) {
        this.data = data;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }
}
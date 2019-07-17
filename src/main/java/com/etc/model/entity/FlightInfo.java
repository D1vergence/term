package com.etc.model.entity;

public class FlightInfo {
    private Integer fid;

    private String fno;

    private String departure;

    private String arrival;

    private String ptype;

    private String sta;

    private String std;

    private String ata;

    private String atd;

    private String atype;

    private String airport;

    private String lat;

    private String lon;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFno() {
        return fno;
    }

    public void setFno(String fno) {
        this.fno = fno == null ? null : fno.trim();
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure == null ? null : departure.trim();
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival == null ? null : arrival.trim();
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype == null ? null : ptype.trim();
    }

    public String getSta() {
        return sta;
    }

    public void setSta(String sta) {
        this.sta = sta == null ? null : sta.trim();
    }

    public String getStd() {
        return std;
    }

    public void setStd(String std) {
        this.std = std == null ? null : std.trim();
    }

    public String getAta() {
        return ata;
    }

    public void setAta(String ata) {
        this.ata = ata == null ? null : ata.trim();
    }

    public String getAtd() {
        return atd;
    }

    public void setAtd(String atd) {
        this.atd = atd == null ? null : atd.trim();
    }

    public String getAtype() {
        return atype;
    }

    public void setAtype(String atype) {
        this.atype = atype == null ? null : atype.trim();
    }

    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport == null ? null : airport.trim();
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat == null ? null : lat.trim();
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon == null ? null : lon.trim();
    }
}
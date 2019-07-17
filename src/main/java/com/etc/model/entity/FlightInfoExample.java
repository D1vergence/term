package com.etc.model.entity;

import java.util.ArrayList;
import java.util.List;

public class FlightInfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public FlightInfoExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andFidIsNull() {
            addCriterion("fid is null");
            return (Criteria) this;
        }

        public Criteria andFidIsNotNull() {
            addCriterion("fid is not null");
            return (Criteria) this;
        }

        public Criteria andFidEqualTo(Integer value) {
            addCriterion("fid =", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotEqualTo(Integer value) {
            addCriterion("fid <>", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidGreaterThan(Integer value) {
            addCriterion("fid >", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidGreaterThanOrEqualTo(Integer value) {
            addCriterion("fid >=", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLessThan(Integer value) {
            addCriterion("fid <", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidLessThanOrEqualTo(Integer value) {
            addCriterion("fid <=", value, "fid");
            return (Criteria) this;
        }

        public Criteria andFidIn(List<Integer> values) {
            addCriterion("fid in", values, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotIn(List<Integer> values) {
            addCriterion("fid not in", values, "fid");
            return (Criteria) this;
        }

        public Criteria andFidBetween(Integer value1, Integer value2) {
            addCriterion("fid between", value1, value2, "fid");
            return (Criteria) this;
        }

        public Criteria andFidNotBetween(Integer value1, Integer value2) {
            addCriterion("fid not between", value1, value2, "fid");
            return (Criteria) this;
        }

        public Criteria andFnoIsNull() {
            addCriterion("fno is null");
            return (Criteria) this;
        }

        public Criteria andFnoIsNotNull() {
            addCriterion("fno is not null");
            return (Criteria) this;
        }

        public Criteria andFnoEqualTo(String value) {
            addCriterion("fno =", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoNotEqualTo(String value) {
            addCriterion("fno <>", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoGreaterThan(String value) {
            addCriterion("fno >", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoGreaterThanOrEqualTo(String value) {
            addCriterion("fno >=", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoLessThan(String value) {
            addCriterion("fno <", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoLessThanOrEqualTo(String value) {
            addCriterion("fno <=", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoLike(String value) {
            addCriterion("fno like", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoNotLike(String value) {
            addCriterion("fno not like", value, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoIn(List<String> values) {
            addCriterion("fno in", values, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoNotIn(List<String> values) {
            addCriterion("fno not in", values, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoBetween(String value1, String value2) {
            addCriterion("fno between", value1, value2, "fno");
            return (Criteria) this;
        }

        public Criteria andFnoNotBetween(String value1, String value2) {
            addCriterion("fno not between", value1, value2, "fno");
            return (Criteria) this;
        }

        public Criteria andDepartureIsNull() {
            addCriterion("departure is null");
            return (Criteria) this;
        }

        public Criteria andDepartureIsNotNull() {
            addCriterion("departure is not null");
            return (Criteria) this;
        }

        public Criteria andDepartureEqualTo(String value) {
            addCriterion("departure =", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureNotEqualTo(String value) {
            addCriterion("departure <>", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureGreaterThan(String value) {
            addCriterion("departure >", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureGreaterThanOrEqualTo(String value) {
            addCriterion("departure >=", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureLessThan(String value) {
            addCriterion("departure <", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureLessThanOrEqualTo(String value) {
            addCriterion("departure <=", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureLike(String value) {
            addCriterion("departure like", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureNotLike(String value) {
            addCriterion("departure not like", value, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureIn(List<String> values) {
            addCriterion("departure in", values, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureNotIn(List<String> values) {
            addCriterion("departure not in", values, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureBetween(String value1, String value2) {
            addCriterion("departure between", value1, value2, "departure");
            return (Criteria) this;
        }

        public Criteria andDepartureNotBetween(String value1, String value2) {
            addCriterion("departure not between", value1, value2, "departure");
            return (Criteria) this;
        }

        public Criteria andArrivalIsNull() {
            addCriterion("arrival is null");
            return (Criteria) this;
        }

        public Criteria andArrivalIsNotNull() {
            addCriterion("arrival is not null");
            return (Criteria) this;
        }

        public Criteria andArrivalEqualTo(String value) {
            addCriterion("arrival =", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalNotEqualTo(String value) {
            addCriterion("arrival <>", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalGreaterThan(String value) {
            addCriterion("arrival >", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalGreaterThanOrEqualTo(String value) {
            addCriterion("arrival >=", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalLessThan(String value) {
            addCriterion("arrival <", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalLessThanOrEqualTo(String value) {
            addCriterion("arrival <=", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalLike(String value) {
            addCriterion("arrival like", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalNotLike(String value) {
            addCriterion("arrival not like", value, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalIn(List<String> values) {
            addCriterion("arrival in", values, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalNotIn(List<String> values) {
            addCriterion("arrival not in", values, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalBetween(String value1, String value2) {
            addCriterion("arrival between", value1, value2, "arrival");
            return (Criteria) this;
        }

        public Criteria andArrivalNotBetween(String value1, String value2) {
            addCriterion("arrival not between", value1, value2, "arrival");
            return (Criteria) this;
        }

        public Criteria andPtypeIsNull() {
            addCriterion("ptype is null");
            return (Criteria) this;
        }

        public Criteria andPtypeIsNotNull() {
            addCriterion("ptype is not null");
            return (Criteria) this;
        }

        public Criteria andPtypeEqualTo(String value) {
            addCriterion("ptype =", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeNotEqualTo(String value) {
            addCriterion("ptype <>", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeGreaterThan(String value) {
            addCriterion("ptype >", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeGreaterThanOrEqualTo(String value) {
            addCriterion("ptype >=", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeLessThan(String value) {
            addCriterion("ptype <", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeLessThanOrEqualTo(String value) {
            addCriterion("ptype <=", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeLike(String value) {
            addCriterion("ptype like", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeNotLike(String value) {
            addCriterion("ptype not like", value, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeIn(List<String> values) {
            addCriterion("ptype in", values, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeNotIn(List<String> values) {
            addCriterion("ptype not in", values, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeBetween(String value1, String value2) {
            addCriterion("ptype between", value1, value2, "ptype");
            return (Criteria) this;
        }

        public Criteria andPtypeNotBetween(String value1, String value2) {
            addCriterion("ptype not between", value1, value2, "ptype");
            return (Criteria) this;
        }

        public Criteria andStaIsNull() {
            addCriterion("sta is null");
            return (Criteria) this;
        }

        public Criteria andStaIsNotNull() {
            addCriterion("sta is not null");
            return (Criteria) this;
        }

        public Criteria andStaEqualTo(String value) {
            addCriterion("sta =", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaNotEqualTo(String value) {
            addCriterion("sta <>", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaGreaterThan(String value) {
            addCriterion("sta >", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaGreaterThanOrEqualTo(String value) {
            addCriterion("sta >=", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaLessThan(String value) {
            addCriterion("sta <", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaLessThanOrEqualTo(String value) {
            addCriterion("sta <=", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaLike(String value) {
            addCriterion("sta like", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaNotLike(String value) {
            addCriterion("sta not like", value, "sta");
            return (Criteria) this;
        }

        public Criteria andStaIn(List<String> values) {
            addCriterion("sta in", values, "sta");
            return (Criteria) this;
        }

        public Criteria andStaNotIn(List<String> values) {
            addCriterion("sta not in", values, "sta");
            return (Criteria) this;
        }

        public Criteria andStaBetween(String value1, String value2) {
            addCriterion("sta between", value1, value2, "sta");
            return (Criteria) this;
        }

        public Criteria andStaNotBetween(String value1, String value2) {
            addCriterion("sta not between", value1, value2, "sta");
            return (Criteria) this;
        }

        public Criteria andStdIsNull() {
            addCriterion("std is null");
            return (Criteria) this;
        }

        public Criteria andStdIsNotNull() {
            addCriterion("std is not null");
            return (Criteria) this;
        }

        public Criteria andStdEqualTo(String value) {
            addCriterion("std =", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdNotEqualTo(String value) {
            addCriterion("std <>", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdGreaterThan(String value) {
            addCriterion("std >", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdGreaterThanOrEqualTo(String value) {
            addCriterion("std >=", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdLessThan(String value) {
            addCriterion("std <", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdLessThanOrEqualTo(String value) {
            addCriterion("std <=", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdLike(String value) {
            addCriterion("std like", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdNotLike(String value) {
            addCriterion("std not like", value, "std");
            return (Criteria) this;
        }

        public Criteria andStdIn(List<String> values) {
            addCriterion("std in", values, "std");
            return (Criteria) this;
        }

        public Criteria andStdNotIn(List<String> values) {
            addCriterion("std not in", values, "std");
            return (Criteria) this;
        }

        public Criteria andStdBetween(String value1, String value2) {
            addCriterion("std between", value1, value2, "std");
            return (Criteria) this;
        }

        public Criteria andStdNotBetween(String value1, String value2) {
            addCriterion("std not between", value1, value2, "std");
            return (Criteria) this;
        }

        public Criteria andAtaIsNull() {
            addCriterion("ata is null");
            return (Criteria) this;
        }

        public Criteria andAtaIsNotNull() {
            addCriterion("ata is not null");
            return (Criteria) this;
        }

        public Criteria andAtaEqualTo(String value) {
            addCriterion("ata =", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaNotEqualTo(String value) {
            addCriterion("ata <>", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaGreaterThan(String value) {
            addCriterion("ata >", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaGreaterThanOrEqualTo(String value) {
            addCriterion("ata >=", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaLessThan(String value) {
            addCriterion("ata <", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaLessThanOrEqualTo(String value) {
            addCriterion("ata <=", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaLike(String value) {
            addCriterion("ata like", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaNotLike(String value) {
            addCriterion("ata not like", value, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaIn(List<String> values) {
            addCriterion("ata in", values, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaNotIn(List<String> values) {
            addCriterion("ata not in", values, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaBetween(String value1, String value2) {
            addCriterion("ata between", value1, value2, "ata");
            return (Criteria) this;
        }

        public Criteria andAtaNotBetween(String value1, String value2) {
            addCriterion("ata not between", value1, value2, "ata");
            return (Criteria) this;
        }

        public Criteria andAtdIsNull() {
            addCriterion("atd is null");
            return (Criteria) this;
        }

        public Criteria andAtdIsNotNull() {
            addCriterion("atd is not null");
            return (Criteria) this;
        }

        public Criteria andAtdEqualTo(String value) {
            addCriterion("atd =", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdNotEqualTo(String value) {
            addCriterion("atd <>", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdGreaterThan(String value) {
            addCriterion("atd >", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdGreaterThanOrEqualTo(String value) {
            addCriterion("atd >=", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdLessThan(String value) {
            addCriterion("atd <", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdLessThanOrEqualTo(String value) {
            addCriterion("atd <=", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdLike(String value) {
            addCriterion("atd like", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdNotLike(String value) {
            addCriterion("atd not like", value, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdIn(List<String> values) {
            addCriterion("atd in", values, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdNotIn(List<String> values) {
            addCriterion("atd not in", values, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdBetween(String value1, String value2) {
            addCriterion("atd between", value1, value2, "atd");
            return (Criteria) this;
        }

        public Criteria andAtdNotBetween(String value1, String value2) {
            addCriterion("atd not between", value1, value2, "atd");
            return (Criteria) this;
        }

        public Criteria andAtypeIsNull() {
            addCriterion("atype is null");
            return (Criteria) this;
        }

        public Criteria andAtypeIsNotNull() {
            addCriterion("atype is not null");
            return (Criteria) this;
        }

        public Criteria andAtypeEqualTo(String value) {
            addCriterion("atype =", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeNotEqualTo(String value) {
            addCriterion("atype <>", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeGreaterThan(String value) {
            addCriterion("atype >", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeGreaterThanOrEqualTo(String value) {
            addCriterion("atype >=", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeLessThan(String value) {
            addCriterion("atype <", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeLessThanOrEqualTo(String value) {
            addCriterion("atype <=", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeLike(String value) {
            addCriterion("atype like", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeNotLike(String value) {
            addCriterion("atype not like", value, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeIn(List<String> values) {
            addCriterion("atype in", values, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeNotIn(List<String> values) {
            addCriterion("atype not in", values, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeBetween(String value1, String value2) {
            addCriterion("atype between", value1, value2, "atype");
            return (Criteria) this;
        }

        public Criteria andAtypeNotBetween(String value1, String value2) {
            addCriterion("atype not between", value1, value2, "atype");
            return (Criteria) this;
        }

        public Criteria andAirportIsNull() {
            addCriterion("airport is null");
            return (Criteria) this;
        }

        public Criteria andAirportIsNotNull() {
            addCriterion("airport is not null");
            return (Criteria) this;
        }

        public Criteria andAirportEqualTo(String value) {
            addCriterion("airport =", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportNotEqualTo(String value) {
            addCriterion("airport <>", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportGreaterThan(String value) {
            addCriterion("airport >", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportGreaterThanOrEqualTo(String value) {
            addCriterion("airport >=", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportLessThan(String value) {
            addCriterion("airport <", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportLessThanOrEqualTo(String value) {
            addCriterion("airport <=", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportLike(String value) {
            addCriterion("airport like", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportNotLike(String value) {
            addCriterion("airport not like", value, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportIn(List<String> values) {
            addCriterion("airport in", values, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportNotIn(List<String> values) {
            addCriterion("airport not in", values, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportBetween(String value1, String value2) {
            addCriterion("airport between", value1, value2, "airport");
            return (Criteria) this;
        }

        public Criteria andAirportNotBetween(String value1, String value2) {
            addCriterion("airport not between", value1, value2, "airport");
            return (Criteria) this;
        }

        public Criteria andLatIsNull() {
            addCriterion("lat is null");
            return (Criteria) this;
        }

        public Criteria andLatIsNotNull() {
            addCriterion("lat is not null");
            return (Criteria) this;
        }

        public Criteria andLatEqualTo(String value) {
            addCriterion("lat =", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotEqualTo(String value) {
            addCriterion("lat <>", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatGreaterThan(String value) {
            addCriterion("lat >", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatGreaterThanOrEqualTo(String value) {
            addCriterion("lat >=", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatLessThan(String value) {
            addCriterion("lat <", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatLessThanOrEqualTo(String value) {
            addCriterion("lat <=", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatLike(String value) {
            addCriterion("lat like", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotLike(String value) {
            addCriterion("lat not like", value, "lat");
            return (Criteria) this;
        }

        public Criteria andLatIn(List<String> values) {
            addCriterion("lat in", values, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotIn(List<String> values) {
            addCriterion("lat not in", values, "lat");
            return (Criteria) this;
        }

        public Criteria andLatBetween(String value1, String value2) {
            addCriterion("lat between", value1, value2, "lat");
            return (Criteria) this;
        }

        public Criteria andLatNotBetween(String value1, String value2) {
            addCriterion("lat not between", value1, value2, "lat");
            return (Criteria) this;
        }

        public Criteria andLonIsNull() {
            addCriterion("lon is null");
            return (Criteria) this;
        }

        public Criteria andLonIsNotNull() {
            addCriterion("lon is not null");
            return (Criteria) this;
        }

        public Criteria andLonEqualTo(String value) {
            addCriterion("lon =", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonNotEqualTo(String value) {
            addCriterion("lon <>", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonGreaterThan(String value) {
            addCriterion("lon >", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonGreaterThanOrEqualTo(String value) {
            addCriterion("lon >=", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonLessThan(String value) {
            addCriterion("lon <", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonLessThanOrEqualTo(String value) {
            addCriterion("lon <=", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonLike(String value) {
            addCriterion("lon like", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonNotLike(String value) {
            addCriterion("lon not like", value, "lon");
            return (Criteria) this;
        }

        public Criteria andLonIn(List<String> values) {
            addCriterion("lon in", values, "lon");
            return (Criteria) this;
        }

        public Criteria andLonNotIn(List<String> values) {
            addCriterion("lon not in", values, "lon");
            return (Criteria) this;
        }

        public Criteria andLonBetween(String value1, String value2) {
            addCriterion("lon between", value1, value2, "lon");
            return (Criteria) this;
        }

        public Criteria andLonNotBetween(String value1, String value2) {
            addCriterion("lon not between", value1, value2, "lon");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
package com.etc.service;

import com.etc.model.dao.AdminMapper;
import com.etc.model.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    private AdminMapper adminMapper;

    public AdminMapper getAdminMapper() {
        return adminMapper;
    }
    @Autowired
    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public Admin getAdminByName(String username){
        return adminMapper.selectByPrimaryKey(username);
    }
}

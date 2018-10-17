package com.doing.src.entity.user;

import java.util.Date;

public class AdminLoginInfo {
    private String adminId;

    private String adminPwd;

    private Integer adminState;

    private Integer adminRank;

    private Date adminDt;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd == null ? null : adminPwd.trim();
    }

    public Integer getAdminState() {
        return adminState;
    }

    public void setAdminState(Integer adminState) {
        this.adminState = adminState;
    }

    public Integer getAdminRank() {
        return adminRank;
    }

    public void setAdminRank(Integer adminRank) {
        this.adminRank = adminRank;
    }

    public Date getAdminDt() {
        return adminDt;
    }

    public void setAdminDt(Date adminDt) {
        this.adminDt = adminDt;
    }
}
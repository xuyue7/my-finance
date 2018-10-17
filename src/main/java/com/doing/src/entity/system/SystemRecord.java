package com.doing.src.entity.system;

import java.util.Date;

public class SystemRecord {
    private String adminId;

    private String loginIp;

    private String loginAddress;

    private Date recordDt;
    
    private String showTime;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public String getLoginAddress() {
        return loginAddress;
    }

    public void setLoginAddress(String loginAddress) {
        this.loginAddress = loginAddress == null ? null : loginAddress.trim();
    }

    public Date getRecordDt() {
        return recordDt;
    }

    public void setRecordDt(Date recordDt) {
        this.recordDt = recordDt;
    }

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
}
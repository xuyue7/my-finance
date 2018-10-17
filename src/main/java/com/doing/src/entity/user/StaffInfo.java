package com.doing.src.entity.user;

import java.util.Date;

public class StaffInfo {
    private String staffId;

    private String staffName;

    private String staffSex;

    private Date staffBirth;

    private String staffTel;

    private String staffAddress;

    private String staffDescribe;

    private String showBirth;
    
    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId == null ? null : staffId.trim();
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName == null ? null : staffName.trim();
    }

    public String getStaffSex() {
        return staffSex;
    }

    public void setStaffSex(String staffSex) {
        this.staffSex = staffSex == null ? null : staffSex.trim();
    }

    public Date getStaffBirth() {
        return staffBirth;
    }

    public void setStaffBirth(Date staffBirth) {
        this.staffBirth = staffBirth;
    }

    public String getStaffTel() {
        return staffTel;
    }

    public void setStaffTel(String staffTel) {
        this.staffTel = staffTel == null ? null : staffTel.trim();
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress == null ? null : staffAddress.trim();
    }

    public String getStaffDescribe() {
        return staffDescribe;
    }

    public void setStaffDescribe(String staffDescribe) {
        this.staffDescribe = staffDescribe == null ? null : staffDescribe.trim();
    }

	public String getShowBirth() {
		return showBirth;
	}

	public void setShowBirth(String showBirth) {
		this.showBirth = showBirth;
	}
}
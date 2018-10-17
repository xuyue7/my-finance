package com.doing.src.entity.property;

import java.util.Date;

public class PropertyInfo {
    private String propertyId;

    private String propertyTypeId;

    private Integer propertyUseId;

    private String propertyTitle;

    private String propertyDescribe;

    private Integer propertyCount;

    private String adminId;

    private Date propertyDt;
    
    private String showTime;
    
    public String getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(String propertyId) {
        this.propertyId = propertyId == null ? null : propertyId.trim();
    }

    public String getPropertyTypeId() {
        return propertyTypeId;
    }

    public void setPropertyTypeId(String propertyTypeId) {
        this.propertyTypeId = propertyTypeId == null ? null : propertyTypeId.trim();
    }

    public Integer getPropertyUseId() {
        return propertyUseId;
    }

    public void setPropertyUseId(Integer propertyUseId) {
        this.propertyUseId = propertyUseId;
    }

    public String getPropertyTitle() {
        return propertyTitle;
    }

    public void setPropertyTitle(String propertyTitle) {
        this.propertyTitle = propertyTitle == null ? null : propertyTitle.trim();
    }

    public String getPropertyDescribe() {
        return propertyDescribe;
    }

    public void setPropertyDescribe(String propertyDescribe) {
        this.propertyDescribe = propertyDescribe == null ? null : propertyDescribe.trim();
    }

    public Integer getPropertyCount() {
        return propertyCount;
    }

    public void setPropertyCount(Integer propertyCount) {
        this.propertyCount = propertyCount;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public Date getPropertyDt() {
        return propertyDt;
    }

    public void setPropertyDt(Date propertyDt) {
        this.propertyDt = propertyDt;
    }

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
}
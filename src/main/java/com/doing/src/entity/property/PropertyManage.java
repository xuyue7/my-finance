package com.doing.src.entity.property;

import java.util.Date;

public class PropertyManage {
    private String propertyId;

    private String manageDescribe;

    private Integer propertyUseId;

    private String adminId;

    private Integer manageDt;

    private Date startDt;

    private Date createDt;

    public String getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(String propertyId) {
        this.propertyId = propertyId == null ? null : propertyId.trim();
    }

    public String getManageDescribe() {
        return manageDescribe;
    }

    public void setManageDescribe(String manageDescribe) {
        this.manageDescribe = manageDescribe == null ? null : manageDescribe.trim();
    }

    public Integer getPropertyUseId() {
        return propertyUseId;
    }

    public void setPropertyUseId(Integer propertyUseId) {
        this.propertyUseId = propertyUseId;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public Integer getManageDt() {
        return manageDt;
    }

    public void setManageDt(Integer manageDt) {
        this.manageDt = manageDt;
    }

    public Date getStartDt() {
        return startDt;
    }

    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    public Date getCreateDt() {
        return createDt;
    }

    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }
}
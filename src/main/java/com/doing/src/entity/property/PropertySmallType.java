package com.doing.src.entity.property;

import java.util.Date;

public class PropertySmallType {
    private String sId;

    private String peopertyId;

    private String sTitle;

    private String sNo;

    private String sAdmin;

    private Date sDt;

    private PropertyType propertyType;
    
    public String getsId() {
        return sId;
    }

    public void setsId(String sId) {
        this.sId = sId == null ? null : sId.trim();
    }

    public String getPeopertyId() {
        return peopertyId;
    }

    public void setPeopertyId(String peopertyId) {
        this.peopertyId = peopertyId == null ? null : peopertyId.trim();
    }

    public String getsTitle() {
        return sTitle;
    }

    public void setsTitle(String sTitle) {
        this.sTitle = sTitle == null ? null : sTitle.trim();
    }

    public String getsNo() {
        return sNo;
    }

    public void setsNo(String sNo) {
        this.sNo = sNo == null ? null : sNo.trim();
    }

    public String getsAdmin() {
        return sAdmin;
    }

    public void setsAdmin(String sAdmin) {
        this.sAdmin = sAdmin == null ? null : sAdmin.trim();
    }

    public Date getsDt() {
        return sDt;
    }

    public void setsDt(Date sDt) {
        this.sDt = sDt;
    }

	public PropertyType getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(PropertyType propertyType) {
		this.propertyType = propertyType;
	}
}
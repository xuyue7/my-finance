package com.doing.src.entity.property;
import java.util.Date;
import java.util.List;

public class PropertyType {
    private String propertyTypeId;

    private String propertyTypeTitle;

    private String adminId;

    private Date propertyTypeDt;
    
    private String showTime;
    
    private List<PropertySmallType> propertySmallType;
    
    public String getPropertyTypeId() {
        return propertyTypeId;
    }

    public void setPropertyTypeId(String propertyTypeId) {
        this.propertyTypeId = propertyTypeId == null ? null : propertyTypeId.trim();
    }

    public String getPropertyTypeTitle() {
        return propertyTypeTitle;
    }

    public void setPropertyTypeTitle(String propertyTypeTitle) {
        this.propertyTypeTitle = propertyTypeTitle == null ? null : propertyTypeTitle.trim();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public Date getPropertyTypeDt() {
        return propertyTypeDt;
    }

    public void setPropertyTypeDt(Date propertyTypeDt) {
        this.propertyTypeDt = propertyTypeDt;
    }



	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	public List<PropertySmallType> getPropertySmallType() {
		return propertySmallType;
	}

	public void setPropertySmallType(List<PropertySmallType> propertySmallType) {
		this.propertySmallType = propertySmallType;
	}
}
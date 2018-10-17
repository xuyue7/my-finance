package com.doing.src.entity.credential;

import java.util.Date;

public class FinanceSubject {
    private String subjectId;

    private String subjectTitle;

    private String adminId;

    private Date subjectDt;
    
    private String	showDate;

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId == null ? null : subjectId.trim();
    }

    public String getSubjectTitle() {
        return subjectTitle;
    }

    public void setSubjectTitle(String subjectTitle) {
        this.subjectTitle = subjectTitle == null ? null : subjectTitle.trim();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public Date getSubjectDt() {
        return subjectDt;
    }

    public void setSubjectDt(Date subjectDt) {
        this.subjectDt = subjectDt;
    }

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}
}
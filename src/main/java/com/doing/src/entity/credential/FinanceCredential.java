package com.doing.src.entity.credential;

import java.util.Date;

public class FinanceCredential {
    private String credentialId;

    private String userName;

    private String adminId;

    private String credentialTitle;

    private String credentialContent;

    private String subjectId;

    private String credentialCount;

    private Date credentialDt;

    public String getCredentialId() {
        return credentialId;
    }

    public void setCredentialId(String credentialId) {
        this.credentialId = credentialId == null ? null : credentialId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public String getCredentialTitle() {
        return credentialTitle;
    }

    public void setCredentialTitle(String credentialTitle) {
        this.credentialTitle = credentialTitle == null ? null : credentialTitle.trim();
    }

    public String getCredentialContent() {
        return credentialContent;
    }

    public void setCredentialContent(String credentialContent) {
        this.credentialContent = credentialContent == null ? null : credentialContent.trim();
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId == null ? null : subjectId.trim();
    }

    public String getCredentialCount() {
        return credentialCount;
    }

    public void setCredentialCount(String credentialCount) {
        this.credentialCount = credentialCount == null ? null : credentialCount.trim();
    }

    public Date getCredentialDt() {
        return credentialDt;
    }

    public void setCredentialDt(Date credentialDt) {
        this.credentialDt = credentialDt;
    }
}
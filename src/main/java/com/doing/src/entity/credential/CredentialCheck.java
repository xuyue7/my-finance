package com.doing.src.entity.credential;

import java.util.Date;

public class CredentialCheck {
    private String credentialId;

    private Integer credentialState;

    private String credentialReason;

    private String adminId;

    private Date createDt;

    public String getCredentialId() {
        return credentialId;
    }

    public void setCredentialId(String credentialId) {
        this.credentialId = credentialId == null ? null : credentialId.trim();
    }

    public Integer getCredentialState() {
        return credentialState;
    }

    public void setCredentialState(Integer credentialState) {
        this.credentialState = credentialState;
    }

    public String getCredentialReason() {
        return credentialReason;
    }

    public void setCredentialReason(String credentialReason) {
        this.credentialReason = credentialReason == null ? null : credentialReason.trim();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId == null ? null : adminId.trim();
    }

    public Date getCreateDt() {
        return createDt;
    }

    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }
}
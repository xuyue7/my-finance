package com.doing.src.entity.wx_user;

import java.util.Date;

public class SocketMsg {
    private Integer id;

    private String content;

    private Integer hfuid;

    private Integer bhfuid;

    private Integer state;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getHfuid() {
        return hfuid;
    }

    public void setHfuid(Integer hfuid) {
        this.hfuid = hfuid;
    }

    public Integer getBhfuid() {
        return bhfuid;
    }

    public void setBhfuid(Integer bhfuid) {
        this.bhfuid = bhfuid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
package com.doing.src.entity;

public class UserInfo {
    private Integer userId;

    private String userName;

    private String userSex;

    private String userCardNo;

    private String userImg;

    private String userCardImgf;

    private String userCardImga;

    private String userAdd;

    private String userTel;

    private Integer userState;

    private Integer userRealName;
    
    private String wxImg;
    
    private String wxId;
    
    private String wxName;
    
    //将数据库0和1转换为字符串
    public String getUserRealName1() {
    	if(userRealName == 0) {
    		return "未实名";
    	}else if(userRealName == 1) {
    		return "已实名";
    	}
    	return "未知错误";
    }
    public String getUserState1() {
    	if(userState == 0) {
    		return "已禁用";
    	}else if(userState == 1) {
    		return "未禁用";
    	}
    	return "未知错误";
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex == null ? null : userSex.trim();
    }

    public String getUserCardNo() {
        return userCardNo;
    }

    public void setUserCardNo(String userCardNo) {
        this.userCardNo = userCardNo == null ? null : userCardNo.trim();
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg == null ? null : userImg.trim();
    }

    public String getUserCardImgf() {
        return userCardImgf;
    }

    public void setUserCardImgf(String userCardImgf) {
        this.userCardImgf = userCardImgf == null ? null : userCardImgf.trim();
    }

    public String getUserCardImga() {
        return userCardImga;
    }

    public void setUserCardImga(String userCardImga) {
        this.userCardImga = userCardImga == null ? null : userCardImga.trim();
    }

    public String getUserAdd() {
        return userAdd;
    }

    public void setUserAdd(String userAdd) {
        this.userAdd = userAdd == null ? null : userAdd.trim();
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

    public Integer getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(Integer userRealName) {
        this.userRealName = userRealName;
    }
	public String getWxName() {
		return wxName;
	}
	public void setWxName(String wxName) {
		this.wxName = wxName;
	}
	public String getWxImg() {
		return wxImg;
	}
	public void setWxImg(String wxImg) {
		this.wxImg = wxImg;
	}
	public String getWxId() {
		return wxId;
	}
	public void setWxId(String wxId) {
		this.wxId = wxId;
	}
	
//	private UserInfo search;
//
//	public UserInfo getSearch() {
//		return search;
//	}
//	public void setSearch(UserInfo search) {
//		this.search = search;
//	}
}
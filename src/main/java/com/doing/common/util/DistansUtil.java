package com.doing.common.util;

import java.util.HashMap;
import java.util.Map;

public class DistansUtil {
	/**
	 * 根据当前经纬度和距离计算经纬度区间
	 * @param longitude
	 * @param latitude
	 * @param distans
	 * @return
	 */
	public static Map<String, Double> findNeighPosition(double longitude,double latitude,double distans){
        //先计算查询点的经纬度范围
        double r = 6371;//地球半径千米
        double dis = distans;//千米距离
        double dlng =  2*Math.asin(Math.sin(dis/(2*r))/Math.cos(latitude*Math.PI/180));
        dlng = dlng*180/Math.PI;//角度转为弧度
        double dlat = dis/r;
        dlat = dlat*180/Math.PI;        
        double minlat =latitude-dlat;
        double maxlat = latitude+dlat;
        double minlng = longitude -dlng;
        double maxlng = longitude + dlng;
        Map<String, Double> map=new HashMap<>();
        map.put("minlng", minlng);
        map.put("maxlng", maxlng);
        map.put("minlat", minlat);
        map.put("maxlat", maxlat);
       return map;
		
	}
}

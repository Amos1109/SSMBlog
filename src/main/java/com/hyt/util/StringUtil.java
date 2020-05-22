package com.hyt.util;

public class StringUtil {
	public static String formatLike(String str) {
		if(isNotEmpty(str)) {
			return "%"+str+"%";
		}
		return null;
	}
	
	public static boolean isNotEmpty(String str) {
		if(str!=null&&!"".equals(str.trim())) {
			return true;
		}
		return false;
	}
	
	public static boolean isEmpty(String str) {
		if(str==null||"".equals(str.trim())) {
			return true;
		}
		return false;
	}
}

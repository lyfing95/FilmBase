package com.lyf.filmbase.util;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DateUtil {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyy");
    public static String getId(){
    	Random random = new Random();
    	Date date = new Date();
    	String resu = sdf.format(date)+(random.nextInt(1000)+1000);
    	return resu;
    }
    
}

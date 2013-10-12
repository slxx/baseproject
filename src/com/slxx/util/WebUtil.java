package com.slxx.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.hibernate.Session;


/**
 * 
 * @author Administrator
 *
 */
public class WebUtil {
	/** 
     * 将长时间格式字符串转换为字符串 yyyy-MM-dd HH:mm:ss 
	     * @return 
	     */ 

	 public static String  longToStrngDateTime(String time){  
		       // String time="1256006105375";//long型转换成的字符串  
		        Date date= new Date(Long.parseLong(time.trim()));  
		       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		       String dateString = formatter.format(date);
		        return dateString;  
		     }  

	 
	 /**
	     * 将yyyy-MM-dd HH:mm:ss 时间格式字符串转化成时间
	     * @return
	     */
	    public static Date StringToDate(String time){
	        //String time="2013-10-21 10:35:05";//时间格式的字符串
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date s=null;
	        try {
	             s= formatter.parse(time);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	       // System.out.println("TIME:::"+s);
	        return s;
	    }
	    
	    /**
	       * 获取现在时间
	       *
	       * @return返回字符串格式 yyyy-MM-dd HH:mm:ss
	       */
	    public static String getStringDate() {
	       Date currentTime = new Date();
	       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       String dateString = formatter.format(currentTime);
	     //  System.out.println("TIME:::"+dateString);
	       return dateString;
	    }
	    
	    /**
		 * 将20090402103531 转换成 yyyy-MM-dd HH:mm:ss形式输出
		 * @return
		 */
		public static String strToDatestr(String ssss) {
			//String ssss = "20130402103531";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String sss = null;
			try {
				sss = sdf2.format(sdf.parse(ssss));
				//System.out.println("result" + sss);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return sss;
		}
		
		
		/**
		 * 生成随机文件名
		 */
		public static String getRandomFileName(String originalName) {
			// 获取原始文件的后缀
			int index = originalName.lastIndexOf('.');
			if (index == originalName.length() - 1) index = -1;
			String suffix = index == -1 ? "" : ("." + originalName.substring(index + 1));
			while (true) {
				String fileName = System.currentTimeMillis() +
					"" + new Double(899999 * Math.random() + 100000).intValue() + suffix;
				return fileName;
			}
		}
		
		public static void copyFile(File srcFile, File destFile) throws IOException{
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			
			try{
				bis = new BufferedInputStream(new FileInputStream(srcFile));
				bos = new BufferedOutputStream(new FileOutputStream(destFile));
				byte[] buf = new byte[8192];
				
				for(int count = -1; (count = bis.read(buf))!= -1; ){
					bos.write(buf, 0, count);
				}
				bos.flush();
			}catch(IOException ie){
				throw ie;
			}finally{
				if(bis != null){
					bis.close();
				}
				if(bos != null){
					bos.close();
				}
			}
		}
}

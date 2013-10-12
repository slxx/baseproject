package com.slxx.actions;

/**
 * ViewAction.java
 * com.sword.actions
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2010-7-1 		lidl
 *
 * Copyright (c) 2010, TNT All Rights Reserved.
*/

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * ClassName:ViewAction
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   lidl
 * @version  
 * @since    Ver 1.1
 * @Date	 2010-7-1		下午05:54:31
 *
 * @see 	 
 */
public class FTPAction extends ActionSupport{
/*	private int validateNum;
	private File filePath;
	private String filePathFileName;
	
	
	public String upload(){
		
			System.out.println(filePath == null);
			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath("/temp");
			String targetFileName = generateFileName(filePathFileName);
			File target = new File(targetDirectory, targetFileName);
			targetDirectory+="/"+targetFileName;
			try {
				FileUtils.copyFile(filePath, target);
			} catch (IOException e) {
	
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				System.out.println(targetDirectory);
				FTPUtil ftp=new FTPUtil();
				try {
					ftp.connectServer("192.168.1.112", "slxx", "slxx", "/ftp");
					System.out.println("filesize:"
							+ ftp.upload(targetDirectory) + "字节");
				} catch (IOException e) {
					
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				} catch (Exception e) {
					
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}finally{
					try {
						ftp.closeServer();
					} catch (IOException e) {
						
						// TODO Auto-generated catch block
						e.printStackTrace();
						
					}
				}
			}
			return "success";
		
	}
	 private String generateFileName(String fileName) {   
		     DateFormat format = new SimpleDateFormat("yyMMddHHmmss");   
		     String formatDate = format.format(new Date());   
		        
		     int random = new Random().nextInt(10000);   
		        
		     int position = fileName.lastIndexOf(".");   
		     String extension = fileName.substring(position); 
		     return formatDate + random + extension;   
		 }
	public int getValidateNum() {
		return validateNum;
	}
	public void setValidateNum(int validateNum) {
		this.validateNum = validateNum;
	}
	public File getFilePath() {
		return filePath;
	}
	public void setFilePath(File filePath) {
		this.filePath = filePath;
	}*/
	
}

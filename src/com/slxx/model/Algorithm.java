package com.slxx.model;

import java.io.Serializable;
import java.util.Set;


/**
 * The persistent class for the Sys_Menu database table.
 * 
 */

public class Algorithm implements Serializable {

	
	
	
	private int algorithmId;

		
	private String algorithmName;
	private String algorithmExplain;

	private String algorithmClass;
	
	

	private String jarPath;
	private String dataPath;
	
    private String operDateTime;

	
	private int operUserId;
	
	

    private boolean isValid;
	private String algorithmOutPath;
	
	
	public Algorithm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Algorithm(int algorithmId) {
		super();
		this.algorithmId = algorithmId;
	}

	public Algorithm(int algorithmId, String algorithmName,
			String algorithmExplain, String algorithmClass, String jarPath,
			String dataPath, String operDateTime, int operUserId,
			boolean isValid, String algorithmOutPath) {
		super();
		this.algorithmId = algorithmId;
		this.algorithmName = algorithmName;
		this.algorithmExplain = algorithmExplain;
		this.algorithmClass = algorithmClass;
		this.jarPath = jarPath;
		this.dataPath = dataPath;
		this.operDateTime = operDateTime;
		this.operUserId = operUserId;
		this.isValid = isValid;
		this.algorithmOutPath = algorithmOutPath;
	}

	public String getAlgorithmExplain() {
		return algorithmExplain;
	}

	public void setAlgorithmExplain(String algorithmExplain) {
		this.algorithmExplain = algorithmExplain;
	}

	public String getAlgorithmClass() {
		return algorithmClass;
	}

	public void setAlgorithmClass(String algorithmClass) {
		this.algorithmClass = algorithmClass;
	}

	

	public String getAlgorithmOutPath() {
		return algorithmOutPath;
	}

	public void setAlgorithmOutPath(String algorithmOutPath) {
		this.algorithmOutPath = algorithmOutPath;
	}

	public String getJarPath() {
		return jarPath;
	}

	public void setJarPath(String jarPath) {
		this.jarPath = jarPath;
	}

	public String getDataPath() {
		return dataPath;
	}

	public void setDataPath(String dataPath) {
		this.dataPath = dataPath;
	}

	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}

	
	

	
	
	public int getAlgorithmId() {
		return algorithmId;
	}

	public void setAlgorithmId(int algorithmId) {
		this.algorithmId = algorithmId;
	}

	public String getAlgorithmName() {
		return algorithmName;
	}

	public void setAlgorithmName(String algorithmName) {
		this.algorithmName = algorithmName;
	}

	

	

	public String getOperDateTime() {
		return operDateTime;
	}

	public void setOperDateTime(String operDateTime) {
		this.operDateTime = operDateTime;
	}

	public int getOperUserId() {
		return operUserId;
	}

	public void setOperUserId(int operUserId) {
		this.operUserId = operUserId;
	}

	
	public boolean getIsValid() {
		return this.isValid;
	}

	public void setIsValid(boolean isValid) {
		this.isValid = isValid;
	}

	


}
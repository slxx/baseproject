package com.slxx.model;

public class JobLog {
	private int jobLogId;
	private String jobId;
	private String loginUserName;
	private int jobState;
	private String jobStartTime;
	private String diagnosticInfo;
    private String operDateTime;
	private int operUserId;
    private boolean isValid;
    private Algorithm algorithm;
    
    
    
	public JobLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public JobLog(int jobLogId, String jobId, String loginUserName,
			int jobState, String jobStartTime, String diagnosticInfo,
			String operDateTime, int operUserId, boolean isValid,
			Algorithm algorithm) {
		super();
		this.jobLogId = jobLogId;
		this.jobId = jobId;
		this.loginUserName = loginUserName;
		this.jobState = jobState;
		this.jobStartTime = jobStartTime;
		this.diagnosticInfo = diagnosticInfo;
		this.operDateTime = operDateTime;
		this.operUserId = operUserId;
		this.isValid = isValid;
		this.algorithm = algorithm;
	}

	public Algorithm getAlgorithm() {
		return algorithm;
	}
	public void setAlgorithm(Algorithm algorithm) {
		this.algorithm = algorithm;
	}
	public int getJobLogId() {
		return jobLogId;
	}
	public void setJobLogId(int jobLogId) {
		this.jobLogId = jobLogId;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		jobId = jobId;
	}
	public String getLoginUserName() {
		return loginUserName;
	}
	public void setLoginUserName(String loginUserName) {
		this.loginUserName = loginUserName;
	}
	public int getJobState() {
		return jobState;
	}
	public void setJobState(int jobState) {
		this.jobState = jobState;
	}
	public String getJobStartTime() {
		return jobStartTime;
	}
	public void setJobStartTime(String jobStartTime) {
		this.jobStartTime = jobStartTime;
	}
	public String getDiagnosticInfo() {
		return diagnosticInfo;
	}
	public void setDiagnosticInfo(String diagnosticInfo) {
		this.diagnosticInfo = diagnosticInfo;
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
	public boolean isValid() {
		return isValid;
	}
	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}
    
}

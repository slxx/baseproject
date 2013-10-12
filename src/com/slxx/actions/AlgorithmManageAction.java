package com.slxx.actions;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;


import org.apache.hadoop.conf.Configuration;

import org.apache.hadoop.mapred.JobStatus;

import web.hadoop.util.RunJobThread;



import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Algorithm;
import com.slxx.model.User;
import com.slxx.service.AlgorithmService;
import com.slxx.util.HadoopConfUtils;
import com.slxx.util.PageView;
import com.slxx.util.WebUtil;

/**
 * AlgorithmManageAction
 * 
 * @author
 * 
 */
public class AlgorithmManageAction {

	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	

	/**
	 * 新增页面跳转
	 * 
	 * @return
	 */
	public String goUploadUI() {
		return "add";
	}

	/**
	 * 新增信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String uploadAlgorithm() throws Exception {
		String time = df.format(new Date());
		algorithm.setOperDateTime(time);
		User u = (User) ActionContext.getContext().getSession().get("user");
		algorithm.setOperUserId(u.getUserId());
		algorithm.setAlgorithmOutPath(HadoopConfUtils.JOBROOTURL+algorithm.getAlgorithmOutPath());//拼凑输出路径
		//File basePath = new File(ServletActionContext.getServletContext().getRealPath("\\WEB-INF\\lib"));//服务器目录
		File basePath = new File("c:\\temp\\upload");//临时存放目录
		if (!basePath.exists()) {
			basePath.mkdirs();
		}
		if(jar!=null&&jarFileName!=null){//上传jar文件到tocamt服务器
			algorithm.setJarPath(basePath.getCanonicalPath() + "/"+ WebUtil.getRandomFileName(jarFileName));
			WebUtil.copyFile(jar, new File(algorithm.getJarPath()));
		}
		if(data!=null&&dataFileName!=null){//上传输入文件到HDFS指定的文件目录下
			algorithm.setDataPath(HadoopConfUtils.uploadHDFS(data,dataFileName));
		}
		
		algorithmService.saveObject(algorithm);

		return getPageList();
	}
	
	public String getPageList() throws Exception {
		PageView<Algorithm> pageView = new PageView<Algorithm>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("algorithmId", "desc");
		pageView.setQueryResult(algorithmService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}

	public String getStatusPage() throws Exception {
		PageView<JobStatus> pageView = new PageView<JobStatus>(10, page);
		ArrayList<JobStatus> jobStatusAll = HadoopConfUtils
				.getJobStatusAll(new Configuration());
		pageView.setQueryResult(jobStatusAll);
		ActionContext.getContext().put("pageView", pageView);
		return "lookStatus";
	}
	public String toJobStart() {
		algorithm=algorithmService.findObject(algorithm.getAlgorithmId());
		ActionContext.getContext().put("algorithm", algorithm);
		return "jobStartParam";
	}

	public String  jobStart()throws  Exception {
		algorithm=algorithmService.findObject(algorithm.getAlgorithmId());
		if(data!=null&&dataFileName!=null){//新的处理文件
			algorithm.setDataPath(HadoopConfUtils.uploadHDFS(data,dataFileName));//上传输入文件到HDFS指定的文件目录下
		}
		if(outPath!=null&&!outPath.equals("")){//新的输出路径
			algorithm.setAlgorithmOutPath(outPath);
		}
		
		String[] agrAlls=new String[5];
		agrAlls[0]="-libjars";
		agrAlls[1]="file:/"+algorithm.getJarPath().replace("\\","/");
	    agrAlls[2]=algorithm.getDataPath();
		String randomFileName = System.currentTimeMillis() +"" + new Double(8999 * Math.random() + 10000).intValue();
		agrAlls[3]=algorithm.getAlgorithmOutPath()+"\\"+randomFileName;//运行时在输出文件夹下面产生随机子文件夹
		agrAlls[4]=algorithm.getAlgorithmClass();
		new Thread(new RunJobThread(agrAlls,algorithm.getAlgorithmId())).start();
	 	ActionContext.getContext().put("map", 0);
	 	ActionContext.getContext().put("reduce", 0);
	   // message="算法正在处理中……";
	 	//return "pub_message";
	    return getPageList();
	}
	
	
	
	
	public String getJobProgress()throws Exception {
			
			JobStatus jobStatus = HadoopConfUtils.getJobStatus(new Configuration());
			float[] progress=new float[2];
			progress[0]=jobStatus.mapProgress();
			progress[1]=jobStatus.reduceProgress();
			ActionContext.getContext().put("map", progress[0]);
		 	ActionContext.getContext().put("reduce", progress[1]);
		 	return "JobProgress";
	}
	
	
	
	
		
	private File jar;
	private File data;
	private String dataFileName;
	private String jarFileName;
	private String outPath;
	public String getOutPath() {
		return outPath;
	}

	public void setOutPath(String outPath) {
		this.outPath = outPath;
	}

	public String getJarFileName() {
		return jarFileName;
	}

	public void setJarFileName(String jarFileName) {
		this.jarFileName = jarFileName;
	}

	private Algorithm algorithm;

	public String getDataFileName() {
		return dataFileName;
	}

	public void setDataFileName(String dataFileName) {
		this.dataFileName = dataFileName;
	}

	public File getData() {
		return data;
	}

	public void setData(File data) {
		this.data = data;
	}
	private AlgorithmService algorithmService;

	private int page = 1;

	public File getJar() {
		return jar;
	}

	public void setJar(File jar) {
		this.jar = jar;
	}

	public AlgorithmService getAlgorithmService() {
		return algorithmService;
	}

	public void setAlgorithmService(AlgorithmService algorithmService) {
		this.algorithmService = algorithmService;
	}

	public Algorithm getAlgorithm() {
		return algorithm;
	}

	public void setAlgorithm(Algorithm algorithm) {
		this.algorithm = algorithm;
	}

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}

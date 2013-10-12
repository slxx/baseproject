package com.slxx.util;



import java.io.File;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.ArrayList;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobStatus;


/**
 * HadoopConfUtils
 * @author 
 *
 */
public final class HadoopConfUtils {
	
	// set cluster job tracker
	public static String JOBTRACKER="192.168.1.123:9001";
	
	public static String HADOOP_HOST="192.168.1.123";
	//自定义文件保存路径
	public static String JOBSAVEPATH="hdfs://192.168.1.123:9000/user/hadoop/data/";
	//hadoop上传根目录
	public static String JOBROOTURL="hdfs://192.168.1.123:9000";
		
	
	public static int HADOOP_PORT=9001;
	
	public static long JOB_START_TIME=System.currentTimeMillis();
	
	public static final Configuration conf=new Configuration();;
	static {
		conf.set("mapred.job.tracker", HadoopConfUtils.JOBTRACKER);
	}
	// get map and reduce progress
	public static float[] getMapReduceProgess(JobStatus jobStatus){
		float[] progress=new float[2];
		progress[0]=jobStatus.mapProgress();
		progress[1]=jobStatus.reduceProgress();
		return progress;
	}
	
	// get job status from configuration
	public static JobStatus getJobStatus(Configuration conf) throws IOException{
		JobStatus[] jobStatusAll=new JobClient(new InetSocketAddress(HADOOP_HOST, HADOOP_PORT), conf).getAllJobs();
	//	System.out.println("jobStatusAll length:"+jobStatusAll.length);
		JobStatus jobStatus=jobStatusAll[jobStatusAll.length-1];
		return jobStatus;

	}
	public static JobStatus getJobStatus() throws IOException{
		return getJobStatus(conf);
	}
	
	public static ArrayList<JobStatus>   getJobStatusAll(Configuration conf) throws IOException{
		ArrayList<JobStatus> alist=new ArrayList<JobStatus>();
		 InetSocketAddress addr = new InetSocketAddress(HADOOP_HOST, HADOOP_PORT);
		 JobClient jc= new JobClient(addr, conf);
		JobStatus[] jobStatusAll=jc.getAllJobs();

		
	//	JobStatus[] jobStatusAll=new JobClient(new InetSocketAddress(HADOOP_HOST, HADOOP_PORT), conf).getAllJobs();
		for(JobStatus status:jobStatusAll){
			alist.add(status);
			
		}
		return alist;
	}
	public static float[] getMapReduceProgess(Configuration conf) throws IOException{
		JobStatus jobStatus=getJobStatus(conf);
	//	System.out.println("job id:"+jobStatus.getJobID().getId());
		float[] progress=getMapReduceProgess(jobStatus);
		/*if(progress[0]==1.0){
			System.out.println("job id:"+jobStatus.getJobID().getId());
			long jobStartTime=jobStatus.getStartTime();
			System.out.println("Utils.JOB_START_TIME:"+Utils.JOB_START_TIME);
			if(jobStartTime<Utils.JOB_START_TIME){
				System.out.println("job start time:"+jobStartTime);
				progress=new float[2];
			}
		}*/
		return progress;
	}
	
	public static float[] getMapReduceProgess() throws IOException{
		return getMapReduceProgess(conf);
	}
	
	
	//上传输入文件到HDFS指定的文件目录下
	public static String uploadHDFS(File dataFile,String dataFileName) {
				Configuration conf = new Configuration();
				conf.set("mapred.jop.tracker", "hdfs://192.168.1.123:9001");
				conf.set("fs.default.name", "hdfs://192.168.1.123:9000");
				 try {
				FileSystem fs = FileSystem.get(conf);
				String soucePath=dataFile.getCanonicalPath();
				int i= soucePath.lastIndexOf("\\");//E:\\temp\\test.txt获得最后文件名的下标
					if(i>0){
					 String souceRoot=soucePath.substring(0,i)+"\\";
					 dataFile.renameTo(new File(souceRoot+dataFileName));//重命名得到的源文件
					 Path src = new Path(souceRoot+dataFileName);
					 Path dst = new Path(HadoopConfUtils.JOBSAVEPATH);//自定义的文件的保存路径下
					 fs.copyFromLocalFile(src, dst);
					 fs.close();
					 return (dst.toString()+"/"+dataFileName);
					}else{
						return null;
					}
					 
				} catch (Exception e) {
					e.printStackTrace();
					  return null;
				}
				 
			}
				
	public static String uploadHDFS(File dataFile) throws IOException{
		//conf = new Configuration();
		FileSystem fs = FileSystem.get(HadoopConfUtils.conf);
		//String newName=WebUtil.getRandomFileName(dataFileName);
		//Path src = new Path("/home/hadoop/"+newName);
		Path src = new Path(dataFile.getCanonicalPath());
		Path dst = new Path("hdfs://192.168.1.123:9000/user/hadoop/data/");
		fs.copyFromLocalFile(src, dst);
		fs.close();
		return null;
	}
	public static JobStatus getCurrentMaxJobStatus(Configuration conf) throws IOException{
		JobClient jobClient=new JobClient(new InetSocketAddress(HADOOP_HOST, HADOOP_PORT), conf);
		JobStatus[] jobStatusAll=jobClient.getAllJobs();
		JobStatus maxJobStatus=jobStatusAll[0];
		for(int i=1; i<jobStatusAll.length; i++)  
	       {  
	           if(jobStatusAll[i].getJobID().getId()>maxJobStatus.getJobID().getId())  
	        	   maxJobStatus = jobStatusAll[i];  
	       }  
		return maxJobStatus;

	}
	public static JobStatus getCurrentMaxCompleteJobStatus(Configuration conf) throws IOException{
		JobClient jobClient=new JobClient(new InetSocketAddress(HADOOP_HOST, HADOOP_PORT), conf);
		JobStatus[] jobStatusAll=jobClient.getAllJobs();
		JobStatus maxJobStatus=jobStatusAll[0];
		for(int i=1; i<jobStatusAll.length; i++)  
	       {  if(jobStatusAll[i].isJobComplete()){
	           if(jobStatusAll[i].getJobID().getId()>maxJobStatus.getJobID().getId())  
	        	   maxJobStatus = jobStatusAll[i];  
	        }
	       }  
		return maxJobStatus;

	}			
				
}

package web.hadoop.util;

import java.io.Closeable;
import java.io.IOException;

import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;

import org.apache.hadoop.conf.Configuration;



import org.apache.hadoop.mapred.JobStatus;
import org.apache.hadoop.util.GenericOptionsParser;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

import com.slxx.model.JobLog;
import com.slxx.util.HadoopConfUtils;



public class RunJobThread<T> implements Runnable {
	
	private String[] agrAlls;
	private String[] agrs=new String[4];
	private int algorithmId;
	public RunJobThread(String[] agrAlls,int algorithmId){
		this.agrAlls=agrAlls;
		agrs[0]=agrAlls[0];//-libjars
		agrs[1]=agrAlls[1];//jar包path
		agrs[2]=agrAlls[2];//data path
		agrs[3]=agrAlls[3];//output
		this.algorithmId=algorithmId;
	}
	
	public void run() {
		try {
			Configuration conf = new Configuration();
			URL url = new URL(agrs[1]);
			URLClassLoader myClassLoader  =   new  URLClassLoader( new  URL[]   { url } , Thread.currentThread().getContextClassLoader());
		    Class clazz = myClassLoader.loadClass(agrAlls[4]);//agrAlls[4]为包+类名
			Object o = clazz.newInstance();
			Tool t=null;
			try {
				 t=(Tool)o;
			} catch (Exception e) {
				System.out.println("aaa");
			}
			
			((Closeable) myClassLoader).close();
			String[] otherArgs = new GenericOptionsParser(conf, agrs).getRemainingArgs();
			 int res = ToolRunner.run(conf, t, otherArgs);
			 if(res==0){
				 JobStatus jobStatus = HadoopConfUtils.getCurrentMaxCompleteJobStatus(conf);
				 JobLog jobLog=new JobLog();
				 
				 System.out.println(Thread.currentThread().getName()+"$$$$$$$$$$$$$$0000"+jobStatus.getJobID());
			 }
			 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	  private JobStatus getCurrentJobStatus(JobStatus jobStatus) throws IOException{
		  int jId=jobStatus.getJobID().getId();
		   System.out.println("1111"+jId);
		 //  JobID	jobID= new JobID(jobStatus.getJobID().getJtIdentifier(),jId+1);
		  
		   ArrayList<JobStatus> jobStatusAllList= HadoopConfUtils.getJobStatusAll(new Configuration());
		   JobStatus currentJobStatus=null;
		  for(int i=0;i< jobStatusAllList.size();i++ ){
			 if( jobStatusAllList.get(i).getJobID().getId()==(jId+1)){
				 currentJobStatus=jobStatusAllList.get(i);
			    }
			  }
		  return currentJobStatus;
	  }
  
  
}

package junit.test;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.slxx.model.Rent;
import com.slxx.service.RentService;
public class RentTest {
	private static RentService rentService;
	@BeforeClass
     public static void setUpBeforeClass(){
		ApplicationContext act=new ClassPathXmlApplicationContext("applicationContext-*.xml");
		rentService=(RentService) act.getBean("rentService");
	}
	
	@Test
	public void addRent() throws Exception{
		Rent rent=null;
		for (int i = 0; i <10; i++) {
			rent=new Rent();
			rent.setRentName("rent000"+1);
			rent.setIsValid(true);
			rent.setOperDateTime("2013-08-2809:16:40");
			rent.setRentProperties(1);
			rent.setCreateTime("2013-08-2809:16:40");
			rent.setOperUserId(1);
			rentService.saveObject(rent);
		}
		
	}
	
	
	@Test
	public void updateRent() throws Exception{
		Rent rent=new Rent(1);
		rent.setRentName("111");
		rentService.updateObject(rent);
	}
	
	
	@Test
	public void getRent() throws Exception{
		Rent rent=rentService.findObject(1);
		System.out.println("rent.name:"+rent.getRentName());
	}
	
	@Test
	public void delete() throws Exception{
		rentService.deleteObject(1);
	}
}



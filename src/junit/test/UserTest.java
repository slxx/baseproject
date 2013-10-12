package junit.test;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.slxx.model.Rent;
import com.slxx.model.User;
import com.slxx.service.UserService;
public class UserTest {
	private static UserService userService;
	@BeforeClass
     public static void setUpBeforeClass(){
		ApplicationContext act=new ClassPathXmlApplicationContext("applicationContext-*.xml");
		userService=(UserService) act.getBean("userService");
	}
	
	@Test
	public void addUser() throws Exception{
		User user=null;
		for (int i = 11; i <21; i++) {
			user=new User();
			user.setAccount("rent_user000"+i);
			user.setUserName("rent_user000"+i);
			user.setPassWord("123456");
			user.setUserPropertier(1);
			user.setIsValid(true);
			user.setOperDateTime("2013-08-2809:16:40");
			user.setOperUserId(1);
			user.setRent(new Rent(i));
			userService.saveObject(user);
		}
		
	}
	
	
	
	@Test
	public void getCount() throws Exception{
		
		long i=userService.getCount();
		System.out.println("user.name:"+i);
	}
	

	
	@Test
	public void updateUser() throws Exception{
		User user=new User(1);
		user.setUserName("111");
		userService.updateObject(user);
	}
	
	/*@Test
	public void getList() throws Exception{
		List<User> userList=userService.getDataList(null, 1, null);
		for(User user:userList){
			System.out.println("user.name:"+user.getUserName());
		}
	}*/
	
	@Test
	public void getUser() throws Exception{
		User user=userService.findObject(1);
		System.out.println("user.name:"+user.getUserName());
	}
	
	@Test
	public void delete() throws Exception{
		userService.deleteObject(1);
	}
}



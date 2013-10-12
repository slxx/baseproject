package junit.test;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.slxx.model.Person;
import com.slxx.model.Rent;
import com.slxx.service.PersonService;
public class PersonTest {
	private static PersonService personService;
	@BeforeClass
     public static void setUpBeforeClass(){
		ApplicationContext act=new ClassPathXmlApplicationContext("applicationContext-*.xml");
		personService=(PersonService) act.getBean("personService");
	}
	
	@Test
	public void addPerson() throws Exception{
		
		Person person=null;
		for (int i = 10; i <20; i++) {
			for (int j = 1; j <7; j++) {
				person=new Person();
				person.setPersonName("person000"+(i+j));
				person.setIsValid(true);
				person.setOperDateTime("2013-08-2809:16:40");
				person.setOperUserId(1);
				person.setRent(new Rent(i));
				personService.saveObject(person);
			}
		}
		/*for (int i = 0; i <60; i++) {
			personService.saveObject(new Person("aaa"+i,true));
		}*/
		
	}
	
	
	
	@Test
	public void getCount() throws Exception{
		
		long i=personService.getCount();
		System.out.println("person.name:"+i);
	}
	

	
	@Test
	public void updatePerson() throws Exception{
		Person person=new Person(1);
		person.setPersonName("111");
		personService.updateObject(person);
	}
	
	/*@Test
	public void getList() throws Exception{
		List<Person> personList=personService.getDataList(null, 1, null);
		for(Person person:personList){
			System.out.println("person.name:"+person.getPersonName());
		}
	}*/
	
	@Test
	public void getPerson() throws Exception{
		Person person=personService.findObject(1);
		System.out.println("person.name:"+person.getPersonName());
	}
	
	@Test
	public void delete() throws Exception{
		personService.deleteObject(1);
	}
}



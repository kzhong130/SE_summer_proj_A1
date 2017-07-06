package action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import model.User;
import net.sf.json.JSONObject;
import service.AppService;


public class AccountAction extends BaseAction{
	
	private int userID;
	private String userName;
	private String password;
	private String realName;
	private String sex;
	private String phone;
	private String email;
	private String address;
	private Timestamp registerDate;
	private String validationProblem;
	private String validationAnswer;
	private int credit;
	private int bookCoin;
	private String province;
	private String city;
	private String area;
	private String town;
	private String prePage;
	
	

	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getRealName(){
		return realName;
	}
	
	public void setRealName(String realName){
		this.realName = realName;
	}
	
	public String getSex(){
		return sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public Timestamp getRegisterDate(){
		return registerDate;
	}
	
	public void setRegisterDate(Timestamp registerDate){
		this.registerDate = registerDate;
	}
	
	public String getValidationProblem(){
		return validationProblem;
	}
	
	public void setValidationProblem(String validationProblem){
		this.validationProblem = validationProblem;
	}
	
	public String getValidationAnswer(){
		return validationAnswer;
	}
	
	public void setValidationAnswer(String validationAnswer){
		this.validationAnswer = validationAnswer;
	}
	
	public int getCredit(){
		return credit;
	}
	
	public void setCredit(int credit){
		this.credit = credit;
	}
	
	public int getBookCoin(){
		return bookCoin;
	}
	
	public void setBookCoin(int bookCoin){
		this.bookCoin = bookCoin;
	}
	
	public String getProvince(){
		return province;
	}
	
	public void setProvince(String province){
		this.province = province;
	}
	
	public String getCity(){
		return city;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getArea(){
		return area;
	}
	
	public void setArea(String area){
		this.area = area;
	}
	
	public String getTown(){
		return town;
	}
	
	public void setTown(String town){
		this.town = town;
	}
	
	public String getPrePage(){
		return prePage;
	}
	
	public void setPrePage(String prePage){
		this.prePage = prePage;
	}
	
	public String register() throws Exception{
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		User user=new User(userName,password,realName,sex,phone,email,address,nousedate,validationProblem,validationAnswer,50,50,province,city,area,town);
		int result=appService.addUser(user);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		JSONObject obj = new JSONObject(); 
			
		System.out.println(result);
		if(result>=0){
			obj.put("success",true);
		}
		else {
			obj.put("success",false);	
		}
		String str = obj.toString();  
        System.out.println(str);
		out.write(str);
		out.close();
		System.out.println("reach");
		return "success";
		
		
	}
	
	
	public String login() throws Exception{
		User user = appService.getUserByUserName(userName);
		if (user == null){
			request().getSession().setAttribute("login","error");
			return "login fail";
		}
		if (user.getPassword().equals(password)){
			request().getSession().setAttribute("loginUserName", userName);
			request().getSession().removeAttribute("login");
			return "login success";
		}
		request().getSession().setAttribute("login", "error");
		return "login fail";
	}
	
	public String logout() throws Exception{
		request().getSession().removeAttribute("loginUserName");
		return "logout success";
		
	}
	
	
}
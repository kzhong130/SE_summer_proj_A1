package action;

import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import model.User;
import net.sf.json.JSONObject;
import service.AppService;

public class ForgetPasswordAction extends BaseAction{
	
	private String validationProblem;
	private String validationAnswer;
	private String userName;
	private String password;
	private String verify;
	
	public String getVerify(){
		return verify;
	}
	
	public void setVerify(String verify){
		this.verify = verify;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName = userName;
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
	
	private AppService appService;
	
	public void setAppService(AppService appService){
		this.appService=appService;
	}
	
	public String checkName() throws Exception{
		User user=appService.getUserByUserName(userName);
		//System.out.println(user.getAddress());
		if(user!=null) {
			System.out.println(user.getValidationProblem());
			request().getSession().setAttribute("userName", userName);
			request().getSession().setAttribute("validationProblem", user.getValidationProblem());
			request().setAttribute("userExist",1);
			return "nameExist";
		}
		else{
			request().setAttribute("userExist",0);
			return "nameNotExist";
		}
	}
	
	public String checkAnswer() throws Exception{
		userName=(String) request().getSession().getAttribute("userName");
		User user=appService.getUserByUserName(userName);
		String answer=user.getValidationAnswer();
		if(answer.equals(validationAnswer)){
			request().setAttribute("RightAnswer",1);
			return "RA";
		}
		request().setAttribute("RightAnswer",0);
		return "WA";
	}
	
	
	public String changePassword() throws Exception{
		userName=(String) request().getSession().getAttribute("userName");
		User user=appService.getUserByUserName(userName);
		user.setPassword(password);
		appService.updateUser(user);
		return "change";
	}
	
	public String verifyEmail() throws Exception{
		String temp = (String) request().getSession().getAttribute("verification");
		System.out.println(temp);
		System.out.println(verify);
		if(!temp.equals(verify)){
			JSONObject obj = new JSONObject(); 
			obj.put("success",false);
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			String str = obj.toString(); 
			out.write(str);
			out.close();
			return "success";
		}
		PrintWriter out = ServletActionContext.getResponse().getWriter();

		//request().getSession().setAttribute("userName", userName);
		JSONObject obj = new JSONObject(); 
		obj.put("success",true);
		String str = obj.toString();  
        
		out.write(str);
		out.close();
		return "success";
	}
	
}

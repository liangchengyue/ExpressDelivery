package org.express.deliver.controllor;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.express.deliver.manager.IUserManager;
import org.express.deliver.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserControllor {
	@Resource(name="userManager")
	private IUserManager userManager;
	@RequestMapping("/login")
	/**
	 * 登录方法
	 * @param user
	 */
	public String login(User user,HttpServletRequest request){
	User user2=	userManager.login(user.getUserName(), user.getPassword());
	if (user2!=null) {
		HttpSession  session=request.getSession();
		session.setAttribute("user", user2);
		return "ui/jsp/main/frame";
	}
		return "";
	}
	@RequestMapping(value="/UserList",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getUserList() throws JsonGenerationException, JsonMappingException, IOException {
		List<User> list=userManager.queryUserByPaging(1, 2, "");
		System.out.println(list.get(0).getAddress());
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@RequestMapping("/regster")
	public String regster() {
		User user=new User();
		user.setUserName("梁城月");
		user.setPassword("123456");
		user.setNickName("憧憬未来");
		user.setAddress("贵州贵阳");
		user.setCredit(0);
		user.setGender("男");
		user.setIdCard("520122199508310031");
		user.setIntegral(0);
		user.setRegDate(new Date());
		user.setTelephone("13078507782");
		user.setUserType("用户");
		userManager.addUser(user);
		return "";
	}
}

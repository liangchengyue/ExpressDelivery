package org.express.deliver.controllor;

import java.io.IOException;
import java.net.URL;
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
/**
 * 用户Controllor类
 * @author 吴文鑫
 *
 */
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
		return "redirect:/ui/jsp/main/frame.jsp";
	}
	else {
		return "redirect:/ui/jsp/commont/loginError.jsp";
	}
		
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
	/**
	 * 注册账户
	 * @return
	 */
	@RequestMapping("/regster")
	public String regster(User user,HttpServletRequest request) {
		//将当前时间设置为注册时间
		user.setRegDate(new Date());
		userManager.addUser(user);
		HttpSession  session=request.getSession();
		session.setAttribute("user", user);
		return "redirect:/ui/jsp/main/frame.jsp";
	}
	/**
	 * 退出登录，返回登录页
	 * @param request 获取网页参数
	 * @return
	 */
	@RequestMapping("/exitLogin")
	public String exitLogin(HttpServletRequest request){
		HttpSession  session=request.getSession();
		session.removeAttribute("user");
		return "redirect:/index.jsp";
	}
}

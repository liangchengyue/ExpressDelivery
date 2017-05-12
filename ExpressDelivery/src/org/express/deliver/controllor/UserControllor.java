package org.express.deliver.controllor;

import java.io.IOException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户Controllor类
 * 
 * @author 吴文鑫
 * 
 */
@Controller
@RequestMapping("/user")
public class UserControllor {
	@Resource(name = "userManager")
	private IUserManager userManager;

	@RequestMapping("/login")
	/**
	 * 登录方法
	 * @param user
	 */
	public ModelAndView login(User user, HttpServletRequest request) {
		User user2 = userManager.login(user);
		ModelAndView modelAndView = null;
		// 视图解释器解析ModelAndVIew是，其中model本生就是一个Map的实现类的子类。

		if (user2 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user2);
			modelAndView = new ModelAndView("redirect:/ui/jsp/main/frame.jsp");
			return modelAndView;
		} else {
			Map<String, Object> model = new HashMap<String, Object>();
			// 视图解析器将model中的每个元素都通过model.put(name, value);
			//这样就可以在JSP页面中通过EL表达式来获取对应的值
			model.put("url", "index.jsp");
			model.put("message", "用户名或密码错误!");
			modelAndView = new ModelAndView("ui/jsp/commont/error", model);
			return modelAndView;
		}

	}
/**
 * 分页查询所有用户信息，显示在后台管理页面中
 * @param keyword
 * @param pageNo
 * @param pageSize
 * @return
 * @throws JsonGenerationException
 * @throws JsonMappingException
 * @throws IOException
 */
	@RequestMapping(value = "/UserList", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserList(String keyword,int pageNo,int pageSize) throws JsonGenerationException,
			JsonMappingException, IOException {
		List<User> list = userManager.queryUserByPaging(pageNo, pageSize, keyword);
		int total=userManager.queryAllUserAcount();
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("{");
		sBuffer.append("\"status\":\"success\",");
		sBuffer.append("\"totals\":"+total+",");
		sBuffer.append("\"data\":");
		sBuffer.append(json);
		sBuffer.append("}");
		return sBuffer.toString();
	}

	/**
	 * 注册账户之前查询所有用户名，以便判断注册时输入的用户名是否已存在
	 * 
	 * @return
	 */
	@RequestMapping("/preRegister")
	public void preRegster(HttpServletRequest request) {
		final HttpSession session = request.getSession();// 取得sesion
		// 开启线程查询数据库的所有用户名
		Thread thread = new Thread() {
			@Override
			public void run() {
				List<String> userNameList = userManager.queryAllUserName();
				session.setAttribute("allUserList", userNameList);
			}
		};
		thread.start();
	}

	/**
	 * 验证用户名是否重复
	 * 
	 * @return 是否重复
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/userNameIsExist")
	@ResponseBody
	public String userNameIsExist(HttpServletRequest request, String userName) {
		List<String> userNameList = (List<String>) request.getSession()
				.getAttribute("allUserList");
		boolean flag = false;
		/**
		 * contains判断userNameList集合里面是否包含了userName
		 */
		if (userNameList.contains(userName)) {
			flag = true;
		}
		return flag + "";
	}

	/**
	 * 注册账户
	 * 
	 * @return
	 */
	@RequestMapping("/regster")
	public String regster(User user, HttpServletRequest request) {
		// 将当前时间设置为注册时间
		user.setRegDate(new Date());
		userManager.addUser(user);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return "redirect:/ui/jsp/main/frame.jsp";
	}

	/**
	 * 退出登录，返回登录页
	 * 
	 * @param request
	 *            获取网页参数
	 * @return
	 */
	@RequestMapping("/exitLogin")
	public String exitLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/index.jsp";
	}
}

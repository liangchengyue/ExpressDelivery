package org.express.deliver.controllor;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.express.deliver.manager.IOrderManager;
import org.express.deliver.manager.IUserManager;
import org.express.deliver.pojo.Order;
import org.express.deliver.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 订单Controllor类
 * 
 * @author 吴文鑫
 * 
 */
@Controller
@RequestMapping("/order")
public class OrderControllor {
	@Resource(name = "orderManager")
	private IOrderManager orderManager;
	@Resource(name="userManager")
	private IUserManager userManager;

	/**
	 * 分页查询所有用户信息，显示在后台管理页面中
	 * 
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/OrderList", produces = "text/html;charset=UTF-8")
	public ModelAndView getOrderList(String keyword, int pageNo, int pageSize)
			throws JsonGenerationException, JsonMappingException, IOException {
		if (keyword == null) {
			keyword = "";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map = orderManager.queryOrderByPaging(pageNo, pageSize, keyword);
		map.put("keyword", keyword);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		
		return new ModelAndView("ui/jsp/tablelist_manger/order/orderlist",
				"result", map);
	}
	@RequestMapping("/addOrder")
	@ResponseBody
	public String addOrder(Order order) {
		System.out.println(order.getName());
		User user=userManager.queryUserById(order.getPreOrderuUser().getId());
		order.setPreOrderuUser(user);
		order.setPreOrderDate(new Date());
		order.setState("未接单");
		orderManager.addOrder(order);
		return "true";
	}
	@RequestMapping("/takeOrder")
	@ResponseBody
	public String takeOrder(Order order){
		Order order2=orderManager.queryOrderById(order.getId());
		User user=userManager.queryUserById(order.getTakeOrderUser().getId());
		order2.setTakeOrderUser(user);
		order2.setState("已接单");
		order2.setTakeOrderDate(new Date());
		orderManager.modifyOrderInfo(order2);
		//接单成功，更新发单 用户积分
		User user2=userManager.queryUserById(order2.getPreOrderuUser().getId());
		user2.setIntegral(user2.getIntegral()-order2.getGrade());
		userManager.modifyUserInfo(user2);
		return  "success";
	}
	/**
	 * 安卓端订单列表
	 * @param keword 关键字
	 * @return
	 */
	@RequestMapping(value = "/queryOrderList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public  String queryOrderList(String keword){
		if (keword==null) {
			keword="";
		}
		List<Order> orders=orderManager.queryOrderLists(keword);
		String json=Order.getOrderListJson(orders);
		return json;
	}
	@RequestMapping(value = "/queryOrdersByTakeUser",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryOrdersByTakeUser(String id) {
		List<Order> orders=orderManager.queryOrdersByTakeUser(id);
		String json=Order.getOrderListJson(orders);
		return json;
	}
	@RequestMapping(value = "/queryOrdersByProUser",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryOrdersByProUser(String id) {
		List<Order> orders=orderManager.queryOrdersByProUser(id);
		String json=Order.getOrderListJson(orders);
		return json;
	}
}

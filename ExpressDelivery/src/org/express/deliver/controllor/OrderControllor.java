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
		order.setPreOrderDate(new Date());
		order.setState("未接单");
		orderManager.addOrder(order);
		return "true";
	}
}

package org.express.deliver.controllor;

import java.io.IOException;
import java.util.List;

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
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
		@RequestMapping(value = "/OrderList", produces = "text/html;charset=UTF-8")
		@ResponseBody
		public String getOrderList() throws JsonGenerationException,
				JsonMappingException, IOException {
			List<Order> list = orderManager.queryOrderByPaging(1, 10, "");
			int total=orderManager.queryAllOrderAcount();
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(list);
			System.out.println(json+"88888");
			StringBuffer sBuffer=new StringBuffer();
			sBuffer.append("{");
			sBuffer.append("\"status\":\"success\",");
			sBuffer.append("\"totals\":"+total+",");
			sBuffer.append("\"data\":");
			sBuffer.append(json);
			sBuffer.append("}");
			return sBuffer.toString();
		}
}

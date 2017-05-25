package org.express.deliver.controllor;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.express.deliver.manager.ICommentManager;
import org.express.deliver.manager.IGoodsManager;
import org.express.deliver.manager.IOrderManager;
import org.express.deliver.pojo.Comment;
import org.express.deliver.pojo.Goods;
import org.express.deliver.pojo.Order;
import org.hibernate.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 评论Comment类
 * 
 * @author 吴文鑫
 * 
 */
@Controller
@RequestMapping("/comment")
public class CommentControllor {
	@Resource(name = "commentManager")
	private ICommentManager commentManager;
	@Resource(name="orderManager")
	private IOrderManager orderManager;

	/**
	 * 分页查询所有评论信息，显示在后台管理页面中
	 * 
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/commentList", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getCommentList() throws JsonGenerationException,
			JsonMappingException, IOException {
		List<Comment> list =commentManager.queryCommentByPaging(1, 10, "");
		int total = commentManager.queryAllCommentAcount();
		String json = Comment.getCommentListJson(list);
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append("{");
		sBuffer.append("\"status\":\"success\",");
		sBuffer.append("\"totals\":" + total + ",");
		sBuffer.append("\"data\":");
		sBuffer.append(json);
		sBuffer.append("}");
		return sBuffer.toString();
	}
	@RequestMapping("/addComment")
	@ResponseBody
	public String addComment(Comment comment) {
		comment.setCommentDate(new Date());
		String orderid=comment.getOrder().getId();
		Order order=orderManager.queryOrderById(orderid);
		comment.setOrder(order);
		commentManager.addComment(comment);
		return "success";
	}
	@RequestMapping(value = "/queryComment", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String queryComment(String orderId) {
		List<Comment> list=commentManager.queryComment(orderId);
		String json=Comment.getCommentListJson(list);
		return json;
	}
}

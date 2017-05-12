package org.express.deliver.controllor;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.express.deliver.manager.IReplyManager;
import org.express.deliver.pojo.Reply;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 回复Reply类
 * 
 * @author 吴文鑫
 * 
 */
@Controller
@RequestMapping("/reply")
public class ReplyControllor {
	@Resource(name = "replyManager")
	private IReplyManager replyManager;

	/**
	 * 分页查询所有回复信息，显示在后台管理页面中
	 * 
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/replyList", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getReplyList() throws JsonGenerationException,
			JsonMappingException, IOException {
		List<Reply> list = replyManager.queryReplyByPaging(1, 10, "");
		int total = replyManager.queryAllReplyAcount();
		String json = Reply.getReplyListJson(list);
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append("{");
		sBuffer.append("\"status\":\"success\",");
		sBuffer.append("\"totals\":" + total + ",");
		sBuffer.append("\"data\":");
		sBuffer.append(json);
		sBuffer.append("}");
		return sBuffer.toString();
	}
}

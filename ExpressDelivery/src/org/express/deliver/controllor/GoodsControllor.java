package org.express.deliver.controllor;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.express.deliver.manager.IBusinessActivitiesManager;
import org.express.deliver.manager.IGoodsManager;
import org.express.deliver.pojo.BusinessActivities;
import org.express.deliver.pojo.Goods;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 货物Goods类
 * 
 * @author 吴文鑫
 * 
 */
@Controller
@RequestMapping("/goods")
public class GoodsControllor {
	@Resource(name = "goodsManager")
	private IGoodsManager goodsManager;

	/**
	 * 分页查询所有商家信息，显示在后台管理页面中
	 * 
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/goodsList", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getGoodsList() throws JsonGenerationException,
			JsonMappingException, IOException {
		List<Goods> list = goodsManager.queryGoodsByPaging(1, 11, "");
		int total = goodsManager.queryAllGoodsAcount();
		String json = Goods.getGoodsListJson(list);
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

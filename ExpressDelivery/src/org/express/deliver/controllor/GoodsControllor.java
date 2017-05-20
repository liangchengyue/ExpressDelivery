package org.express.deliver.controllor;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.express.deliver.manager.IGoodsManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView getGoodsList(String keyword,int pageSize,int pageNo){
		if (keyword==null) {
			keyword="";
		}
		Map<String, Object> map = goodsManager.queryGoodsByPaging(pageNo, pageSize, keyword);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		map.put("keyword", keyword);
//		int total = goodsManager.queryAllGoodsAcount();
//		String json = Goods.getGoodsListJson(list);
//		StringBuffer sBuffer = new StringBuffer();
//		sBuffer.append("{");
//		sBuffer.append("\"status\":\"success\",");
//		sBuffer.append("\"totals\":" + total + ",");
//		sBuffer.append("\"data\":");
//		sBuffer.append(json);
//		sBuffer.append("}");
		return new ModelAndView("ui/jsp/tablelist_manger/goods/goodlist","result",map);
	}
}

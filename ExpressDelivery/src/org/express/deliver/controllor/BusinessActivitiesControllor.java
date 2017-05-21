package org.express.deliver.controllor;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.express.deliver.manager.IBusinessActivitiesManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 订单Controllor类
 * 
 * @author 吴文鑫
 * 
 */
@Controller
@RequestMapping("/businessActivities")
public class BusinessActivitiesControllor {
	@Resource(name = "businessactivitiesManager")
	private IBusinessActivitiesManager businessactivitiesManager;
	
	/**
	 * 分页查询所有商家信息，显示在后台管理页面中
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
		@RequestMapping(value = "/BusinessActivitiesList", produces = "text/html;charset=UTF-8")
	
		public ModelAndView getBusinessActivitiesList(String keyword,int pageSize,int pageNo){
			if (keyword==null) {
				keyword="";
			}
			Map<String, Object> map = businessactivitiesManager.queryBusinessActivitiesByPaging(pageNo, pageSize, keyword);
			map.put("keyword", keyword);
			map.put("pageSize", pageSize);
			map.put("pageNo", pageNo);
//			int total=businessactivitiesManager.queryAllBusinessActivitiesAcount();
//			String json=BusinessActivities.getBusinessActivitiesListJson(list);
//			StringBuffer sBuffer=new StringBuffer();
//			sBuffer.append("{");
//			sBuffer.append("\"status\":\"success\",");
//			sBuffer.append("\"totals\":"+total+",");
//			sBuffer.append("\"data\":");
//			sBuffer.append(json);
//			sBuffer.append("}");
			return new ModelAndView("ui/jsp/tablelist_manger/businessactivities/businessactivitielist","result",map);
		}
}

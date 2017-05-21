package org.express.deliver.controllor;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.JsonMappingException;
import org.express.deliver.manager.IBusinessActivitiesManager;
import org.express.deliver.pojo.BusinessActivities;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;

/**
 * 商家列表Controllor类
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
	 * 添加商家活动
	 * @param businessActivities 商家活动信息
	 * @param request
	 * @param businessactivitiesimg 商家活动图片
	 * @return 商家活动显示页面
	 */
	@RequestMapping("/addBusinessActivities")
	public ModelAndView addBusinessActivities(BusinessActivities businessActivities,
			HttpServletRequest request,MultipartFile businessactivitiesimg) {
		//设置图片路径
		businessActivities.setImagePath(uploadBusinessActivitiesImg(businessactivitiesimg, request));
		// 设置当前时间为添加活动时间
		businessActivities.setAddDate(new Date());
		businessactivitiesManager.addBusinessActivities(businessActivities);
		//添加完成以后，分页查询并显示
		int pageNo=1;
		int pageSize=10;
		String keyword="";
		Map<String, Object> map = businessactivitiesManager
				.queryBusinessActivitiesByPaging(pageNo, pageSize, keyword);
		map.put("keyword", keyword);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		return new ModelAndView(
				"ui/jsp/tablelist_manger/businessactivities/businessactivitielist",
				"result", map);
	}

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
	@RequestMapping(value = "/BusinessActivitiesList", produces = "text/html;charset=UTF-8")
	public ModelAndView getBusinessActivitiesList(String keyword, int pageSize,
			int pageNo) {
		if (keyword == null) {
			keyword = "";
		}
		Map<String, Object> map = businessactivitiesManager
				.queryBusinessActivitiesByPaging(pageNo, pageSize, keyword);
		map.put("keyword", keyword);
		map.put("pageSize", pageSize);
		map.put("pageNo", pageNo);
		return new ModelAndView(
				"ui/jsp/tablelist_manger/businessactivities/businessactivitielist",
				"result", map);
	}

	/**
	 * 上传图片
	 * 
	 * @param userImg
	 * @param request
	 * @return 保存的图片路径
	 */
	public String uploadBusinessActivitiesImg(MultipartFile userImg,
			HttpServletRequest request) {
		// 通过request获取项目实际运行目录,就可以将上传文件存放在项目目录了,不管项目部署在任何地方都可以
		// 图片保存路径
		String filePath = request.getSession().getServletContext()
				.getRealPath("/ui/businessactivitiesimg/1");
		// 获取图片原始名称
		String originalFilename = userImg.getOriginalFilename();
		// 以用户id加图片扩展名给图片命名
		String newFileName = (new Date()).getTime()
				+ originalFilename.substring(originalFilename.lastIndexOf("."));
		String path = filePath + newFileName;
		File file = new File(path);
		if (file.exists()) {
			file.delete();
			file = new File(path);
		}
		try {
			userImg.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 截取图片路径
		path = path.substring(path.indexOf("ui"), path.length());
		// 替换路径中斜杠
		path = path.replace("\\", "/");
		return path;
	}
}

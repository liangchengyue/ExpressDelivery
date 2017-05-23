package org.express.deliver.manager;

import java.util.List;
import java.util.Map;

import org.express.deliver.pojo.BusinessActivities;

/**
 * 操作商家列表业务接口
 * 
 * @author 吴文鑫
 * 
 */
public interface IBusinessActivitiesManager {
	/**
	 * 添加商家活动
	 * 
	 * @param businessActivities
	 *            商家活动
	 */
	public void addBusinessActivities(BusinessActivities businessActivities);

	/**
	 * 分页查询商家列表
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return List 订商家列表的集合
	 */
	public Map<String, Object> queryBusinessActivitiesByPaging(int pageNo,
			int pageSize, String keyword);

	/**
	 * 查询商家列表总数
	 * 
	 * @return 商家列表总数
	 */
	public int queryAllBusinessActivitiesAcount();
	/**
	 * 查询商家活动信息在安卓端显示
	 * @return 商家活动
	 */
	public List<BusinessActivities> queryBusinessActivities();
}

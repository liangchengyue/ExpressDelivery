package org.express.deliver.manager;

import java.util.List;

import org.express.deliver.pojo.BusinessActivities;

/**
 * 操作商家列表业务接口
 * 
 * @author 吴文鑫
 * 
 */
public interface IBusinessActivitiesManager {
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
	public List<BusinessActivities> queryBusinessActivitiesByPaging(int pageNo, int pageSize,
			String keyword);

	/**
	 * 查询商家列表总数
	 * 
	 * @return 商家列表总数
	 */
	public int queryAllBusinessActivitiesAcount();
}

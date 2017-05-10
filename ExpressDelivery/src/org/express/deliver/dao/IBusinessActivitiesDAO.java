package org.express.deliver.dao;

import java.util.List;

import org.express.deliver.pojo.BusinessActivities;

/**
 * 商家活动DAO操作接口
 * 
 * @author 吴文鑫
 * 
 */
public interface IBusinessActivitiesDAO {
	/**
	 * 添加商家活动
	 * 
	 * @param businessActivities 商家活动
	 *            
	 * 
	 */
	public void addBusinessActivities(BusinessActivities businessActivities)
			throws Exception;

	/**
	 * 删除商家活动
	 * 
	 * @param businessActivities
	 *            商家活动
	 */
	public void delBusinessActivities(BusinessActivities businessActivities)
			throws Exception;

	/**
	 * 修改商家活动
	 * 
	 * @param businessActivities
	 *  商家活动
	 */
	public void modifyBusinessActivities(BusinessActivities businessActivities)
			throws Exception;
	/**
	 * 获取商家活动列表
	 * 
	 * @return 商家活动列表
	 */
	public List<BusinessActivities> queryAllBusinessActivities()
			throws Exception;


	/**
	 * 根据ID查询商家活动
	 * 
	 * @param businessActivitiesID
	 * 商家活动ID
	 * @return 商家活动
	 */
	public BusinessActivities queryBusinessActivitiesByID(
			String businessActivitiesID) throws Exception;

	/**
	 * 获取商家活动分页列表
	 * 
	 * @param pageNo 当前页
	 * @param pageSize页面大小
	 * @param Keyword关键字
	 * @return 商家活动分页列表
	 */
	public List<BusinessActivities> queryBusinessActivitiesByPaging(int pageNo,
			int pageSize, String keyword) throws Exception;
}

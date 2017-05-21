package org.express.deliver.manager;

import java.util.List;
import java.util.Map;

import org.express.deliver.pojo.Order;
/**
 * 操作订单业务接口
 * 
 * @author 吴文鑫
 * 
 */
public interface IOrderManager {
	/**
	 * 分页查询订单信息
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return Map 订单信息的集合
	 */
	public Map<String, Object> queryOrderByPaging(int pageNo, int pageSize, String keyword);

	/**
	 * 查询订单总数
	 * 
	 * @return 订单总数
	 */
	public int queryAllOrderAcount();
}

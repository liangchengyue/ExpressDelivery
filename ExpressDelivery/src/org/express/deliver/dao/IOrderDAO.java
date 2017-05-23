package org.express.deliver.dao;

import java.util.List;
import java.util.Map;

import org.express.deliver.pojo.Order;

/**
 * 订单DAO操作接口
 * @author 吴文鑫
 *
 */
public interface IOrderDAO {
	/**
	 * 添加订单
	 * 
	 * @param order
	 *            订单信息
	 */
	public void addOrder(Order order);

	/**
	 * 删除订单
	 * 
	 * @param order
	 *            订单信息
	 */
	public void delOrder(Order order);

	/**
	 * 修改订单
	 * 
	 * @param order
	 *           订单信息
	 */
	public void modifyOrder(Order order);

	/**
	 * 分页查询订单
	 * @param pageNo 当前页
	 * @param pageSize 页面大小
	 * @param keyword 关键字
	 * @return Map 订单信息集合
	 */
	public Map<String, Object> queryOrderByPaging(int pageNo, int pageSize,
			String keyword);
	/**
	 * 查询订单总数
	 * @return 订单总数
	 */
	public int queryAllOrderAcount();
	/**
	 * 查询未接单的订单
	 * @return 订单列表
	 */
	public List<Order> queryOrderLists();
	/**
	 * 根据id查询订单信息
	 * @param id 订单ID
	 * @return 订单信息
	 */
	public Order queryById(String id);
	/**
	 * 根据用户ID查询已接订单
	 * @param id 用户ID
	 * @return 该用户已接订单
	 */
	public List<Order> queryOrdersByTakeUser(String id);
	/**
	 * 根据用户ID查询已发订单
	 * @param id 用户ID
	 * @return 用户已发订单
	 */
	public List<Order> queryOrdersByProUser(String id);
}

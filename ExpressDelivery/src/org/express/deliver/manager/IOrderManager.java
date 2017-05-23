package org.express.deliver.manager;

import java.util.List;
import java.util.Map;

import org.express.deliver.pojo.Order;
import org.express.deliver.pojo.User;
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
	/**
	 * 添加订单
	 * @param order 订单信息
	 */
	public void addOrder(Order order);
	/**
	 * 查询未接单的订单
	 * @return 订单列表
	 */
	public List<Order> queryOrderLists();
	/**
	 * 根据ID查询订单
	 * @param id ID
	 * @return 订单信息
	 */
	public Order queryOrderById(String id);
	/**
	 * 修改订单信息
	 * @param order 订单信息
	 */
	public void modifyOrderInfo(Order order);
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

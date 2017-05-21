package org.express.deliver.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.express.deliver.dao.IOrderDAO;
import org.express.deliver.pojo.Order;
import org.hibernate.Query;
/**
 * 订单DAO操作接口实现类
 * @author 吴文鑫
 *
 */
public class OrderDAOImpl extends BaseDAO implements IOrderDAO {

	@Override
	public void addOrder(Order order) {
		sessionFactory.getCurrentSession().save(order);

	}

	@Override
	public void delOrder(Order order) {
		sessionFactory.getCurrentSession().delete(order);

	}

	@Override
	public void modifyOrder(Order order) {
		sessionFactory.getCurrentSession().update(order);

	}

	@Override
	public Map<String, Object>	 queryOrderByPaging(int pageNo, int pageSize,
			String keyword) {
		String hql="FROM Order AS o WHERE o.state LIKE ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, "%"+keyword+"%");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("count", query.list().size());
		query.setFirstResult((pageNo-1)*pageSize);
		query.setMaxResults(pageSize);
		map.put("oredrs", query.list());
		return map;
	}

	@Override
	public int queryAllOrderAcount() {
		String hql = "SELECT COUNT(o) FROM Order AS o";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public List<Order> queryOrderLists() {
		String hql="FROM Order AS o WHERE o.state='未接单'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}

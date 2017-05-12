package org.express.deliver.manager.impl;

import java.util.List;

import org.express.deliver.dao.IOrderDAO;
import org.express.deliver.manager.IOrderManager;
import org.express.deliver.pojo.Order;

public class OrderManagerImpl implements IOrderManager {
	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	private IOrderDAO orderDAO;

	@Override
	public List<Order> queryOrderByPaging(int pageNo, int pageSize,
			String keyword) {
		return orderDAO.queryOrderByPaging(pageNo, pageSize, keyword);
	}

	@Override
	public int queryAllOrderAcount() {
		return orderDAO.queryAllOrderAcount();
	}

}

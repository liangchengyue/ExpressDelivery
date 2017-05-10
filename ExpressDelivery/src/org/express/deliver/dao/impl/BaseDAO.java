package org.express.deliver.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDAO {
	/**
	 * sessionFactroy
	 */
	@Autowired
	protected SessionFactory sessionFactory;
	/**
	 * 获取sessionFactroy
	 * @return sessionFactroy
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	/**
	 * 设置sessionFactroy
	 * @param sessionFactory sessionFactroy
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
}

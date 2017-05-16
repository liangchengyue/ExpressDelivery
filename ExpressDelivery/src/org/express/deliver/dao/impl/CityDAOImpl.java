package org.express.deliver.dao.impl;

import java.util.List;

import org.express.deliver.dao.ICityDAO;
import org.express.deliver.pojo.City;
import org.hibernate.Query;

public class CityDAOImpl extends BaseDAO implements ICityDAO {

	@Override
	public List<City> getAllCity() {
		String hql="FROM City";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	public List<City> getAllCityByParentId(String id) {
		String hql="FROM City AS c WHERE u.id=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, id);
		return query.list();
	}

	@Override
	public void addCity(City city) {
		sessionFactory.getCurrentSession().save(city);
	}

}

package org.express.deliver.manager.impl;

import java.util.List;

import org.express.deliver.dao.ICityDAO;
import org.express.deliver.manager.ICityManager;
import org.express.deliver.pojo.City;

public class CityManagerImpl implements ICityManager {
	private ICityDAO cityDAO;
	
	public ICityDAO getCityDAO() {
		return cityDAO;
	}

	public void setCityDAO(ICityDAO cityDAO) {
		this.cityDAO = cityDAO;
	}

	@Override
	public List<City> getAllCity() {
		return cityDAO.getAllCity();
	}

	@Override
	public List<City> getAllCityByParentId(String id) {
		return cityDAO.getAllCityByParentId(id);
	}

	@Override
	public void addCity(City city) {
		cityDAO.addCity(city);

	}

}

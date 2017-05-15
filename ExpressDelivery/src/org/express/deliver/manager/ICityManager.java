package org.express.deliver.manager;

import java.util.List;

import org.express.deliver.pojo.City;

/**
 * 区域管理接口
 * @author 梁城月
 *
 */
public interface ICityManager {
	/**
	 * 查询所有地区
	 * @return 所有地区
	 */
	public List<City> getAllCity();
	/**
	 * 根据所属区域ID查询所有区域
	 * @param id  所属区域ID
	 * @return 所有地区
	 */
	public List<City> getAllCityByParentId(String id);
	/**
	 * 添加区域信息
	 * @param city 区域信息
	 */
	public void addCity(City city);
}

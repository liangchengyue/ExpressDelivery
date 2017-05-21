package org.express.deliver.manager.impl;

import java.util.List;
import java.util.Map;

import org.express.deliver.dao.IBusinessActivitiesDAO;
import org.express.deliver.manager.IBusinessActivitiesManager;
import org.express.deliver.pojo.BusinessActivities;

public class BusinessActivitiesManagerImpl implements
		IBusinessActivitiesManager {
	private IBusinessActivitiesDAO businessactivitiesDAO;

	public IBusinessActivitiesDAO getBusinessactivitiesDAO() {
		return businessactivitiesDAO;
	}

	public void setBusinessactivitiesDAO(
			IBusinessActivitiesDAO businessactivitiesDAO) {
		this.businessactivitiesDAO = businessactivitiesDAO;
	}

	@Override
	public Map<String, Object> queryBusinessActivitiesByPaging(int pageNo,
			int pageSize, String keyword) {
		Map<String, Object> map=null;
		try {
			map = businessactivitiesDAO.queryBusinessActivitiesByPaging(
					pageNo, pageSize, keyword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public int queryAllBusinessActivitiesAcount() {
		// TODO Auto-generated method stub
		return businessactivitiesDAO.queryAllBusinessActivitiesAcount();
	}

	@Override
	public void addBusinessActivities(BusinessActivities businessActivities) {
		try {
			businessactivitiesDAO.addBusinessActivities(businessActivities);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

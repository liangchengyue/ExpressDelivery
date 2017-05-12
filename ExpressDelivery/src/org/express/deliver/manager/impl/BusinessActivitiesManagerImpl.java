package org.express.deliver.manager.impl;

import java.util.List;

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
	public List<BusinessActivities> queryBusinessActivitiesByPaging(int pageNo,
			int pageSize, String keyword) {
		List<BusinessActivities> list=null;
		try {
			list = businessactivitiesDAO.queryBusinessActivitiesByPaging(
					pageNo, pageSize, keyword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int queryAllBusinessActivitiesAcount() {
		// TODO Auto-generated method stub
		return businessactivitiesDAO.queryAllBusinessActivitiesAcount();
	}

}

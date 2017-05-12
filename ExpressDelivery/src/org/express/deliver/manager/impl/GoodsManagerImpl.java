package org.express.deliver.manager.impl;

import java.util.List;

import org.express.deliver.dao.IGoodsDAO;
import org.express.deliver.manager.IGoodsManager;
import org.express.deliver.pojo.Goods;

public class GoodsManagerImpl implements IGoodsManager {
	private IGoodsDAO goodsDAO;

	public IGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(IGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	@Override
	public List<Goods> queryGoodsByPaging(int pageNo, int pageSize,
			String keyword) {
		 List<Goods>  list =null;
		try {
			list= goodsDAO.queryGoodsByPaging(pageNo, pageSize, keyword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int queryAllGoodsAcount() {
		// TODO Auto-generated method stub
		return goodsDAO.queryAllGoodsAcount();
	}

}

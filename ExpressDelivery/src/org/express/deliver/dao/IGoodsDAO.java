package org.express.deliver.dao;

import java.util.List;

import org.express.deliver.pojo.BusinessActivities;
import org.express.deliver.pojo.Goods;

/**
 * 货物DAO操作接口
 * @author 吴文鑫
 * 
 */
public interface IGoodsDAO {
	/**
	 * 添加货物信息
	 * 
	 * @param goods
	 *            货物信息
	 * @throws Exception
	 */
	public void addGoods(Goods goods) throws Exception;

	/**
	 * 删除货物信息
	 * 
	 * @param goods
	 *            货物信息
	 * @throws Exception
	 */
	public void delGoods(Goods goods) throws Exception;

	/**
	 * 修改货物信息
	 * 
	 * @param goods
	 *            货物信息
	 * @throws Exception
	 */
	public void modifyGoods(Goods goods) throws Exception;

	/**
	 * 查询全部货物信息
	 * 
	 * @return List 全部货物信息对象的集合
	 */
	public List<Goods> queryAllGoods()
			throws Exception;

	/**
	 * 根据ID查询货物信息
	 * 
	 * @param goodsID
	 *            货物信息ID
	 * @return Goods类
	 */
	public Goods queryGoodsByID(
			String goodsID) throws Exception;

	/**
		 * 分页查询货物信息
	 * @param pageNo 当前页
	 * @param pageSize 页面大小
	 * @param keyword 关键字
	 * @return List 货物信息对象的集合
	 */
	public List<Goods> queryGoodsByPaging(int pageNo,
			int pageSize, String keyword) throws Exception;
	/**
	 * 查询货物总数
	 * @return 货物 总数
	 */
	public int queryAllGoodsAcount();
}

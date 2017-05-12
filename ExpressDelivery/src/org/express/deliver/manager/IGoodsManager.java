package org.express.deliver.manager;

import java.util.List;

import org.express.deliver.pojo.Goods;

public interface IGoodsManager {
	/**
	 * 分页查询货物列表
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return List 货物列表的集合
	 */
	public List<Goods> queryGoodsByPaging(int pageNo, int pageSize,
			String keyword);

	/**
	 * 查询货物列表总数
	 * 
	 * @return 货物总数
	 */
	public int queryAllGoodsAcount();
}

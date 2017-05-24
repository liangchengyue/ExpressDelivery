package org.express.deliver.manager;

import java.util.List;
import java.util.Map;

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
	 * @return Map 货物列表的集合
	 */
	public Map<String, Object> queryGoodsByPaging(int pageNo, int pageSize,
			String keyword);

	/**
	 * 查询货物列表总数
	 * 
	 * @return 货物总数
	 */
	public int queryAllGoodsAcount();
	/**
	 * 添加货物信息
	 * @param goods
	 */
	public void addGoods(Goods goods);
}

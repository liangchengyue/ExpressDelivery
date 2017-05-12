package org.express.deliver.manager;

import java.util.List;

import org.express.deliver.pojo.Reply;


public interface IReplyManager {
	/**
	 * 分页查询回复列表
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return List 评回复列表的集合
	 */
	public List<Reply> queryReplyByPaging(int pageNo, int pageSize,
			String keyword);

	/**
	 * 查询回复列表总数
	 * 
	 * @return 回复总数
	 */
	public int queryAllReplyAcount();
}

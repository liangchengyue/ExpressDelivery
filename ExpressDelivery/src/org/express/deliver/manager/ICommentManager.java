package org.express.deliver.manager;

import java.util.List;

import org.express.deliver.pojo.Comment;

public interface ICommentManager {
	/**
	 * 分页查询评论列表
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return List 评论列表的集合
	 */
	public List<Comment> queryCommentByPaging(int pageNo, int pageSize,
			String keyword);

	/**
	 * 查询评论列表总数
	 * 
	 * @return 评论总数
	 */
	public int queryAllCommentAcount();
	/**
	 * 添加评论
	 * @param comment 评论信息
	 */
	public void addComment(Comment comment);
	/**
	 * 根据订单ID查询
	 * @param orderId
	 * @return 所有评论
	 */
	public List<Comment> queryComment(String orderId);
}

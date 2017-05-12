package org.express.deliver.dao;

import java.util.List;

import javax.xml.stream.events.Comment;

import org.express.deliver.pojo.Goods;

/**
 * 评论DAO操作接口
 * 
 * @author 吴文鑫
 * 
 */
public interface ICommentDAO {
	/**
	 * 添加评论
	 * 
	 * @param comment
	 *           评论信息
	 */
	public void addComment(Comment comment);

	/**
	 * 删除评论信息
	 * 
	 * @param comment
	 *            评论信息
	 */
	public void delComment(Comment comment);

	/**
	 * 修改评论信息
	 * 
	 * @param comment
	 *           评论内容
	 */
	public void modifyComment(Comment comment);

	/**
	 * 根据ID查询评论
	 * 
	 * @param commentID
	 *            评论信息ID
	 * @return
	 */
	public Comment queryCommentByID(String commentID);
	/**
	 * 查询全部评论内容
	 * @return List <Comment> 评论内容对象的集合
	 */
	public List<Comment> queryAllComment();
	/**
	 * 分页查询评论内容
 * @param pageNo 当前页
 * @param pageSize 页面大小
 * @param keyword 关键字
 * @return List  评论信息对象的集合
 */
	public List<Comment> queryCommentByPaging(int pageNo,
			int pageSize, String keyword) throws Exception;
	/**
	 * 查询评论总数
	 * @return 评论总数
	 */
	public int queryAllCommentAcount();
}

package org.express.deliver.dao;

import java.util.List;

import org.express.deliver.pojo.Reply;
/**
 * 回复DAO操作接口
 * @author 吴文鑫
 *
 */
public interface IReplyDAO {
	/**
	 * 添加回复
	 * @param reply 回复内容
	 */
	public void addReply(Reply reply);
	/**
	 * 删除回复
	 * @param reply 回复内容
	 */
	public void delReply(Reply reply);
	/**
	 * 修改回复
	 * @param reply 回复内容
	 */
	public void modifyReply(Reply reply);
	/**
	 * 分页查询回复
	 * @param pageNo 当前页
	 * @param pageSize 页面大小
	 * @param keyword 关键字
	 * @return List 回复信息的集合
	 */
	public List<Reply> queryReplyByPaging(int pageNo,int pageSize,String keyword);
	/**
	 * 查询回复总数
	 * @return 回复总数
	 */
	public int queryAllReplyAcount();
}

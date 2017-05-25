package org.express.deliver.manager.impl;

import java.util.List;

import org.express.deliver.dao.ICommentDAO;
import org.express.deliver.manager.ICommentManager;
import org.express.deliver.pojo.Comment;

public class CommentManagerImpl implements ICommentManager {
	private ICommentDAO commentDAO;

	public ICommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(ICommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	@Override
	public List<Comment> queryCommentByPaging(int pageNo, int pageSize,
			String keyword) {
		List<Comment> list = null;
		try {
			list = commentDAO.queryCommentByPaging(pageNo, pageSize, keyword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int queryAllCommentAcount() {
		// TODO Auto-generated method stub
		return commentDAO.queryAllCommentAcount();
	}

	@Override
	public void addComment(Comment comment) {
		commentDAO.addComment(comment);
		
	}

	@Override
	public List<Comment> queryComment(String orderId) {
		// TODO Auto-generated method stub
		return commentDAO.queryComment(orderId);
	}

}

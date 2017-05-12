package org.express.deliver.manager.impl;

import java.util.List;

import org.express.deliver.dao.IReplyDAO;
import org.express.deliver.manager.IReplyManager;
import org.express.deliver.pojo.Reply;

public class ReplyManagerImpl implements IReplyManager {
	private IReplyDAO replyDAO;

	public IReplyDAO getReplyDAO() {
		return replyDAO;
	}

	public void setReplyDAO(IReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	@Override
	public List<Reply> queryReplyByPaging(int pageNo, int pageSize,
			String keyword) {
		// TODO Auto-generated method stub
		return replyDAO.queryReplyByPaging(pageNo, pageSize, keyword);
	}

	@Override
	public int queryAllReplyAcount() {
		// TODO Auto-generated method stub
		return replyDAO.queryAllReplyAcount();
	}

}

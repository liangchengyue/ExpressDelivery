package org.express.deliver.dao.impl;

import java.util.List;

import org.express.deliver.dao.ICommentDAO;
import org.express.deliver.pojo.Comment;
import org.hibernate.Query;
/**
 * 评论DAO操作接口实现类
 * 
 * @author 吴文鑫
 * 
 */
public class CommentDAOImpl extends BaseDAO implements ICommentDAO {

	@Override
	public void addComment(Comment comment) {
		sessionFactory.getCurrentSession().save(comment);

	}

	@Override
	public void delComment(Comment comment) {
		sessionFactory.getCurrentSession().delete(comment);

	}

	@Override
	public void modifyComment(Comment comment) {
		sessionFactory.getCurrentSession().update(comment);

	}

	@Override
	public Comment queryCommentByID(String commentID) {

		return (Comment) sessionFactory.getCurrentSession().get(Comment.class,
				commentID);
	}

	@Override
	public List<Comment> queryAllComment() {
		String hql = "FROM Comment";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	public List<Comment> queryCommentByPaging(int pageNo, int pageSize,
			String keyword) throws Exception {

		String hql = "FROM Comment AS c WHERE c.content LIKE ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, "%" + keyword + "%");
		// 分页
		query.setFirstResult((pageNo - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int queryAllCommentAcount() {
		String hql = "SELECT COUNT(c) FROM Comment AS c";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return ((Long)query.uniqueResult()).intValue();
	}

}

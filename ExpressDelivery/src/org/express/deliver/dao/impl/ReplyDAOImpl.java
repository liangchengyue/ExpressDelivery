package org.express.deliver.dao.impl;

import java.util.List;

import org.express.deliver.dao.IReplyDAO;
import org.express.deliver.pojo.Reply;
import org.hibernate.Query;
/**
* 回复DAO操作接口实现类
 * @author 吴文鑫
 *
 */
public class ReplyDAOImpl extends BaseDAO implements IReplyDAO {

	@Override
	public void addReply(Reply reply) {
		sessionFactory.getCurrentSession().save(reply);

	}

	@Override
	public void delReply(Reply reply) {
		sessionFactory.getCurrentSession().delete(reply);

	}

	@Override
	public void modifyReply(Reply reply) {
		sessionFactory.getCurrentSession().update(reply);

	}

	@Override
	public List<Reply> queryReplyByPaging(int pageNo, int pageSize,
			String keyword) {
		String hql="FROM Reply AS r WHERE r.content LIKE ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, "%"+keyword+"%");
		query.setFirstResult((pageNo-1)*pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int queryAllReplyAcount() {
		String hql = "SELECT COUNT(r) FROM Reply AS r";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return ((Long)query.uniqueResult()).intValue();
	}

}

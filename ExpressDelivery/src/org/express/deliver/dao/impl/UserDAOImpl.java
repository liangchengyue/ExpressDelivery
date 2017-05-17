package org.express.deliver.dao.impl;

import java.util.List;

import org.express.deliver.dao.IUserDAO;
import org.express.deliver.pojo.User;
import org.hibernate.Query;

/**
 * 用户DAO操作接口实现类
 * 
 * @author 吴文鑫
 * 
 */
public class UserDAOImpl extends BaseDAO implements IUserDAO {

	@SuppressWarnings("unchecked")
	@Override
	public User login(User user) {
		String hql = "FROM User AS u WHERE u.userName=? AND u.password=? AND u.userType=? AND u.expressType = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, user.getUserName());
		query.setString(1, user.getPassword());
		query.setString(2, user.getUserType());
		query.setString(3, user.getExpressType());
		List<User> lUsers = query.list();
		if (lUsers != null && lUsers.size() > 0) {
			return lUsers.get(0);
		}
		return null;
	}

	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);

	}

	@Override
	public void delUser(User user) {
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public void modifyUser(User user) {
		sessionFactory.getCurrentSession().update(user);

	}

	@Override
	public List<User> queryUserByPaging(int pageNo, int pageSize, String keyword,String userType,String expressType) {
		String hql = "FROM User AS u WHERE u.userType=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, userType);
		//query.setString(1, expressType);
//		query.setString(2, "%" + keyword + "%");
//		query.setString(3, "%" + keyword + "%");
		query.setFirstResult((pageNo - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public List<String> queryAllUserName() {
		String hql = "SELECT u.userName FROM User AS u";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<String> allUserNames = query.list();
		return allUserNames;
	}

	@Override
	public int queryAllUserAcount() {
		String hql = "SELECT COUNT(u) FROM User AS u";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return ((Long)query.uniqueResult()).intValue();
	}

}

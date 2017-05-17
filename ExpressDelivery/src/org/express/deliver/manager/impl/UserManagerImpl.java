package org.express.deliver.manager.impl;

import java.util.List;

import org.express.deliver.dao.IUserDAO;
import org.express.deliver.manager.IUserManager;
import org.express.deliver.pojo.User;

public class UserManagerImpl implements IUserManager {
	private IUserDAO userDAO;

	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User login(User user) {
		return userDAO.login(user);
	}

	@Override
	public List<User> queryUserByPaging(int pageNo, int pageSize,
			String keyword, String userType, String expressType) {
		// TODO Auto-generated method stub
		return userDAO.queryUserByPaging(pageNo, pageSize, keyword, userType,
				expressType);
	}

	@Override
	public void addUser(User user) {
		userDAO.addUser(user);

	}

	@Override
	public List<String> queryAllUserName() {
		return userDAO.queryAllUserName();
	}

	@Override
	public int queryAllUserAcount() {

		return userDAO.queryAllUserAcount();
	}

	@Override
	public void modifyUserInfo(User user) {
		userDAO.modifyUser(user);

	}

	@Override
	public void modifyUserPassword(User user) {
		userDAO.modifyUserPassword(user);

	}

	@Override
	public List<String> queryAllUserTelephone() {
		// TODO Auto-generated method stub
		return userDAO.queryAllUserTelephone();
	}

}

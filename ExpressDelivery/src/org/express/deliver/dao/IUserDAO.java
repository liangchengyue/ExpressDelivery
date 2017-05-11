package org.express.deliver.dao;

import java.util.List;

import org.express.deliver.pojo.User;

/**
 * 用户DAO操作接口
 * 
 * @author 吴文鑫
 * 
 */
public interface IUserDAO {
	/**
	 * 用户登录
	 * 
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码
	 * @return 用户信息
	 */
	public User login(User user);

	/**
	 * 添加用户
	 * 
	 * @param user
	 *            用户信息
	 */
	public void addUser(User user);

	/**
	 * 删除用户
	 * 
	 * @param User
	 *           用户信息
	 */
	public void delUser(User user);

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 *            用户信息
	 */
	public void modifyUser(User user);

	/**
	 * 分页查询用户信息
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *           关键字
	 * @return List 用户信息的集合
	 */
	public List<User> queryUserByPaging(int pageNo, int pageSize, String keyword);
}

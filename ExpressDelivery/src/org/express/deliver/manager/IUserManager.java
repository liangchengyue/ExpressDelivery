package org.express.deliver.manager;

import java.util.List;

import org.express.deliver.pojo.User;

/**
 * 操作用户业务接口
 * 
 * @author 梁城月
 * 
 */
public interface IUserManager {
	/**
	 * 用户登录
	 * 
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码
	 * @return 用户信息
	 */
	public User login(String userName, String password);

	/**
	 * 添加用户
	 * 
	 * @param user
	 *            用户信息
	 */
	public void addUser(User user);

	/**
	 * 分页查询用户信息
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return List 用户信息的集合
	 */
	public List<User> queryUserByPaging(int pageNo, int pageSize, String keyword);
}

package org.express.deliver.manager;

import java.util.List;
import java.util.Map;

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
	public User login(User user);
	/**
	 * 安卓用户登录
	 * @param user 用户信息
	 * @return 用户信息
	 */
	public User loginAndroid(User user);

	/**
	 * 添加用户
	 * 
	 * @param user
	 *            用户信息
	 */
	public void addUser(User user);

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 *            用户信息
	 */
	public void modifyUserInfo(User user);
	/**
	 * 分页查询用户信息
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @param userType
	 *            用户类型
	 * @param expressType
	 *            快递类型
	 * @return Map 用户信息的集合
	 */
	/*public Map<String, Object> queryUserByPaging(int pageNo, int pageSize,
			String keyword, String userType, String expressType);*/

	/**
	 * 分页查询用户信息
	 * 
	 * @param pageNo
	 *            当前页
	 * @param pageSize
	 *            页面大小
	 * @param keyword
	 *            关键字
	 * @return Map 用户信息的集合
	 */
	public Map<String, Object> queryUserByPaging(int pageNo, int pageSize,
			String keyword);

	/**
	 * 查询所有用户电话号码
	 * 
	 * @return 所有用户电话号码集合
	 */
	public List<String> queryAllUserTelephone();
	/**
	 * 查询所有用户名
	 * 
	 * @return 所有用户名集合
	 */
	public List<String> queryAllUserName();

	/**
	 * 查询用户总数
	 * 
	 * @return 用户总数
	 */
	public int queryAllUserAcount();

	/**
	 * 根据电话号码修改密码
	 * 
	 * @param user
	 */
	public void modifyUserPassword(User user);
	/**
	 * 根据ID获取用户信息
	 * @param id id
	 * @return 用户信息
	 */
	public User queryUserById(String id);
}

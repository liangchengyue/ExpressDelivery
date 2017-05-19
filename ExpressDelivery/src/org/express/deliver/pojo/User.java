package org.express.deliver.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 用户实体类
 * 
 * @author梁成月
 * 
 */
@Entity
public class User {
	/**
	 * ID
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(length = 50)
	private String id;
	/**
	 * 用户名
	 */
	@Column(length = 50, unique = true, nullable = false)
	private String userName;
	/**
	 *  真实姓名
	 */
	@Column(length = 50, nullable = false)
	private String trueName;
	/**
	 * 密码
	 */
	@Column(length = 50, nullable = false)
	private String password;
	/**
	 * 昵称
	 */
	@Column(length = 50)
	private String nickName;
	/**
	 * 地址ַ
	 */
	@Column(length = 200)
	private String address;
	/**
	 * 用户类型
	 */
	@Column(length = 50, nullable = false)
	private String userType;
	/**
	 * 快递类型
	 */
     @Column(length = 50)                                                        
     private String expressType;
	/**
	 * 电话
	 */
	@Column(length = 50, nullable = false)
	private String telephone;
	/**
	 * 性别
	 */
	@Column(length = 5, nullable = false)
	private String gender;
	/**
	 * 注册日期
	 */
	@Column(nullable = false)
	private Date regDate;
	/**
	 * 信誉度
	 */
	@Column(nullable = false)
	private Integer credit=0;
	/**
	 * 积分
	 */
	@Column(nullable = false)
	private Integer integral=0;
	/**
	 * 身份证号码
	 */
	@Column(length = 18, nullable = false)
	private String idCard;
	/**
	 * 图片路径
	 */
	@Column(length = 200)
	private String imagePath;
	/**
	 * 下单用户列表
	 */
	@OneToMany(mappedBy = "preOrderuUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("id ASC")
	private Set<Order> preOrders = new HashSet<Order>();
	/**
	 * 接单用户列表
	 */
	@OneToMany(mappedBy = "takeOrderUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("id ASC")
	private Set<Order> takeOrders = new HashSet<Order>();
	/**
	 * 商家活动列表
	 */
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("id ASC")
	private Set<BusinessActivities> businessActivities = new HashSet<BusinessActivities>();

	/**
	 * 获取用户ID
	 * 
	 * @return ID
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置ID
	 * 
	 * @param id
	 *            id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 获取用户名
	 * 
	 * @return 用户名
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 设置用户名
	 * 
	 * @param userName
	 *            用户名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	/**
	 *  获取用户真实姓名
	 *  
	 * @return  真实姓名
	 */
	public String getTrueName() {
		return trueName;
	}

	/**
	 * 设置用户真实姓名
	 * 
	 * @param trueName
	 *    真实姓名
	 */
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	/**
	 * 获取密码
	 * 
	 * @return 密码
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 设置密码
	 * 
	 * @param password
	 *            密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取昵称
	 * 
	 * @return昵称
	 */
	public String getNickName() {
		return nickName;
	}

	/**
	 * 设置昵称
	 * 
	 * @param nickName
	 *            昵称
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	/**
	 * 获取地址ַ
	 * 
	 * @return 地址ַ
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * 设置地址ַ
	 * 
	 * @param address
	 *            地址ַ
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 获取用户类型
	 * 
	 * @return 用户类型
	 */
	public String getUserType() {
		return userType;
	}

	/**
	 * 设置用户类型
	 * 
	 * @param userType
	 *            用户类型
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}

	/**
	 * 获取电话号码
	 * 
	 * @return 电话号码
	 */
	public String getTelephone() {
		return telephone;
	}

	/**
	 * 设置电话号码
	 * 
	 * @param telephone
	 *            电话号码
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	/**
	 * 获取性别
	 * 
	 * @return 性别
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * 设置性别
	 * 
	 * @param gender
	 *            性别
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * 
	 * 获取注册日期
	 * 
	 * @return ע注册日期
	 */
	public Date getRegDate() {
		return regDate;
	}

	/**
	 * 设置注册日期
	 * 
	 * @param regDate
	 *            注册日期
	 */
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	/**
	 * 获取信誉度
	 * 
	 * @return 信誉度
	 */
	public Integer getCredit() {
		return credit;
	}

	/**
	 * 设置信誉度
	 * 
	 * @param credit
	 *            信誉度
	 */
	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	/**
	 * 获取积分
	 * 
	 * @return 积分
	 */
	public Integer getIntegral() {
		return integral;
	}

	/**
	 * 设置积分
	 * 
	 * @param integral
	 *            积分
	 */
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	/**
	 * 获取身份证号码
	 * 
	 * @return 身份证号码
	 */
	public String getIdCard() {
		return idCard;
	}

	/**
	 * 设置身份证号码
	 * 
	 * @param idCard
	 *            身份证号码
	 */
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	/**
	 * 获取图片路径
	 * 
	 * @return 图片路径
	 */
	public String getImagePath() {
		return imagePath;
	}

	/**
	 * 设置图片路径
	 * 
	 * @param imagePath
	 *            图片路径
	 */
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	/**
	 * 获取下单列表
	 * 
	 * @return 下单列表
	 */
	public Set<Order> getPreOrders() {
		return preOrders;
	}

	/**
	 * 设置下单列表
	 * 
	 * @param preOrders
	 *            下单列表
	 */
	public void setPreOrders(Set<Order> preOrders) {
		this.preOrders = preOrders;
	}

	/**
	 * 获取接单列表
	 * 
	 * @return 接单列表
	 */
	public Set<Order> getTakeOrders() {
		return takeOrders;
	}

	/**
	 * 设置接单列表
	 * 
	 * @param takeOrders
	 *            接单列表
	 */
	public void setTakeOrders(Set<Order> takeOrders) {
		this.takeOrders = takeOrders;
	}

	/**
	 * 获取活动信息
	 * 
	 * @return 商家活动信息
	 */
	public Set<BusinessActivities> getBusinessActivities() {
		return businessActivities;
	}

	/**
	 * 设置商家活动信息
	 * 
	 * @param businessActivities
	 *            商家活动信息
	 */
	public void setBusinessActivities(Set<BusinessActivities> businessActivities) {
		this.businessActivities = businessActivities;
	}
	/**
	 * 获取快递类型
	 * @return 快递类型
	 */
	public String getExpressType() {
		return expressType;
	}
	/**
	 * 设置快递类型
	 * @param expressType 快递类型
	 */
	public void setExpressType(String expressType) {
		this.expressType = expressType;
	}

	/**
	 * 将List<User>集合转换为json数组
	 * @param list List<User>集合
	 * @return json数组
	 */
	public static String getUserListJson(List<User> list) {
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("[");
		for (User user : list) {
			sBuffer.append("{");
			sBuffer.append("\"id\":");
			sBuffer.append("\""+user.getId()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"address\":");
			sBuffer.append("\""+user.getAddress()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"credit\":");
			sBuffer.append(user.getCredit());
			sBuffer.append(",");
			sBuffer.append("\"gender\":");
			sBuffer.append("\""+user.getGender()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"idCard\":");
			sBuffer.append("\""+user.getIdCard()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"imagePath\":");
			sBuffer.append("\""+user.getImagePath()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"integral\":");
			sBuffer.append(user.getIntegral());
			sBuffer.append(",");
			sBuffer.append("\"nickName\":");
			sBuffer.append("\""+user.getNickName()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"password\":");
			sBuffer.append("\""+user.getPassword()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"regDate\":");
			sBuffer.append("\""+user.getRegDate()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"telephone\":");
			sBuffer.append("\""+user.getTelephone()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"userName\":");
			sBuffer.append("\""+user.getUserName()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"userType\":");
			sBuffer.append("\""+user.getUserType()+"\"");
			sBuffer.append("}");
			sBuffer.append(",");
			
		}
		sBuffer.replace(sBuffer.length()-1, sBuffer.length(), "");
		sBuffer.append("]");
		return sBuffer.toString();
	}
}

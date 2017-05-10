package org.express.deliver.pojo;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

/**
 * 商家活动实体类
 * @author 梁城月
 *
 */
@Entity
public class BusinessActivities {
	/**
	 * id
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	/**
	 * 商家名称
	 */
	@Column(length = 50, nullable = false)
	private String businessName;
	/**
	 * 商家地址ַ
	 */
	@Column(length = 200, nullable = false)
	private String businessAddress;
	/**
	 * 活动内容
	 */
	@Column(length = 500, nullable = false)
	private String activeContent;
	/**
	 *活动开始时间
	 */
	@Column(nullable = false)
	private Date activeStartDate;
	/**
	 * 活动结束时间
	 */
	@Column(nullable = false)
	private Date activeEndDate;
	/**
	 * 所属用户
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	private User user;

	/**
	 * 获取ID
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
	 * 获取商家名称
	 * 
	 * @return 商家名称
	 */
	public String getBusinessName() {
		return businessName;
	}

	/**
	 * 设置商家名称
	 * 
	 * @param businessName商家名称
	 */
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	/**
	 * 设置商家地址ַ
	 * 
	 * @return 商家地址ַ
	 */
	public String getBusinessAddress() {
		return businessAddress;
	}

	/**
	 * 设置商家地址ַ
	 * 
	 * @param businessAddress商家地址ַ
	 */
	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}

	/**
	 * 获取活动内容
	 * 
	 * @return 活动内容
	 */
	public String getActiveContent() {
		return activeContent;
	}

	/**
	 * 设置活动内容
	 * 
	 * @param activeContent活动内容
	 */
	public void setActiveContent(String activeContent) {
		this.activeContent = activeContent;
	}

	/**
	 * 设置活动开始时间
	 * 
	 * @return 活动开始时间
	 */
	public Date getActiveStartDate() {
		return activeStartDate;
	}

	/**
	 * 设置活动开始时间
	 * 
	 * @param activeStartDate
	 *            活动开始时间
	 */
	public void setActiveStartDate(Date activeStartDate) {
		this.activeStartDate = activeStartDate;
	}

	/**
	 * 获取活动结束时间
	 * 
	 * @return活动结束时间
	 */
	public Date getActiveEndDate() {
		return activeEndDate;
	}

	/**
	 * 设置活动结束时间
	 * 
	 * @param activeEndDate
	 *            活动结束时间
	 */
	public void setActiveEndDate(Date activeEndDate) {
		this.activeEndDate = activeEndDate;
	}

	/**
	 * 获取所属用户
	 * 
	 * @return 所属用户
	 */
	public User getUser() {
		return user;
	}

	/**
	 * 设置所属用户
	 * 
	 * @param user
	 *            所属用户
	 */
	public void setUser(User user) {
		this.user = user;
	}

}

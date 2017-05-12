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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 订单实体类
 * @author 梁城月
 *
 */
@Entity
@Table(name="preOrder")
public class Order {
	/**
	 * ID
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(length = 50)
	private String id;
	/**
	 * 
	 * 下单时间
	 */
	@Column(nullable = false)
	private Date preOrderDate;
	/**
	 * 订单状态״̬
	 */
	@Column(length = 50, nullable = false)
	private String state;
	/**
	 * 接单时间
	 */
	private Date takeOrderDate;
	/**
	 * 订单结束时间
	 */
	private Date orderEndDate;
	/**
	 * 备注
	 */
	@Column(length = 500)
	private String remarks;
	/**
	 * 下单用户
	 */
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "preOrderUserId")
	private User preOrderuUser;
	/**
	 * 接单用户
	 */
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "takeOrderUserId")
	private User takeOrderUser;
	/**
	 * 评论列表
	 */
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("id ASC")
	private Set<Comment> comments = new HashSet<Comment>();
	/**
	 * 货物列表
	 */
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@OrderBy("id ASC")
	private Set<Goods> goods = new HashSet<Goods>();

	/**
	 * 获取ID
	 * 
	 * @return id
	 */
	public String getId() {
		return id;
	}

	/**
	 *设置id
	 * 
	 * @param id
	 *            id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 获取下单日期
	 * 
	 * @return 下单日期
	 */
	public Date getPreOrderDate() {
		return preOrderDate;
	}

	/**
	 * 设置下单日期
	 * 
	 * @param preOrderDate
	 *            下单日期
	 */
	public void setPreOrderDate(Date preOrderDate) {
		this.preOrderDate = preOrderDate;
	}

	/**
	 * 获取订单状态
	 * 
	 * @return 订单状态
	 */
	public String getState() {
		return state;
	}

	/**
	 * 设置订单状态
	 * 
	 * @param state 订单状态
	 *            
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * 获取接单时间
	 * 
	 * @return 接单时间
	 */
	public Date getTakeOrderDate() {
		return takeOrderDate;
	}

	/**
	 * 设置接单时间
	 * 
	 * @param takeOrderDate
	 *            接单时间
	 */
	public void setTakeOrderDate(Date takeOrderDate) {
		this.takeOrderDate = takeOrderDate;
	}

	/**
	 * 获取订单结束时间
	 * 
	 * @return 订单结束时间
	 */
	public Date getOrderEndDate() {
		return orderEndDate;
	}

	/**
	 * 设置订单结束时间
	 * 
	 * @param orderEndDate 订单结束时间
	 */
	public void setOrderEndDate(Date orderEndDate) {
		this.orderEndDate = orderEndDate;
	}

	/**
	 * 获取备注
	 * 
	 * @return 备注
	 */
	public String getRemarks() {
		return remarks;
	}

	/**
	 * 设置备注
	 * 
	 * @param remarks
	 *           备注
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	/**
	 * 获取下单用户
	 * 
	 * @return 下单用户
	 */
	@JsonIgnore
	public User getPreOrderuUser() {
		return preOrderuUser;
	}

	/**
	 * 设置下单用户
	 * 
	 * @param preOrderuUser
	 *            下单用户
	 */
	public void setPreOrderuUser(User preOrderuUser) {
		this.preOrderuUser = preOrderuUser;
	}

	/**
	 * 获取接单用户
	 * 
	 * @return 接单用户
	 */
	@JsonIgnore
	public User getTakeOrderUser() {
		return takeOrderUser;
	}

	/**
	 * 设置下单用户
	 * 
	 * @param takeOrderUser
	 *           下单用户
	 */
	public void setTakeOrderUser(User takeOrderUser) {
		this.takeOrderUser = takeOrderUser;
	}

	/**
	 * 设置评论列表
	 * 
	 * @return 评论列表
	 */
	@JsonIgnore
	public Set<Comment> getComments() {
		return comments;
	}

	/**
	 * 设置评论列表
	 * 
	 * @param comments
	 *            评论列表
	 */
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	/**
	 * 获取货物列表
	 * 
	 * @return 货物列表
	 */
	@JsonIgnore
	public Set<Goods> getGoods() {
		return goods;
	}

	/**
	 * 设置货物列表
	 * 
	 * @param goods
	 *            货物列表
	 */
	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}
	/**
	 * 将 List<Order>集合转换为json数组
	 * @param oList  List<Order>集合
	 * @return  json数组
	 */
	public static String getOrderListJson(List<Order> oList) {
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("[");
		for (Order order : oList) {
			sBuffer.append("{");
			sBuffer.append("\"preOrderUserName\":");
			sBuffer.append("\""+order.getPreOrderuUser().getUserName()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"id\":");
			sBuffer.append("\""+order.getId()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"orderEndDate\":");
			sBuffer.append("\""+order.getOrderEndDate()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"preOrderDate\":");
			sBuffer.append("\""+order.getPreOrderDate()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"remarks\":");
			sBuffer.append("\""+order.getRemarks()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"state\":");
			sBuffer.append("\""+order.getState()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"takeOrderDate\":");
			sBuffer.append("\""+order.getTakeOrderDate()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"takeOrderUserName\":");
			sBuffer.append("\""+order.getTakeOrderUser().getUserName()+"\"");
			sBuffer.append("}");
			sBuffer.append(",");
		}
		sBuffer.replace(sBuffer.length()-1, sBuffer.length(), "");
		sBuffer.append("]");
		return sBuffer.toString();
	}

}

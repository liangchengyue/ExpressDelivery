package org.express.deliver.pojo;

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
 * 货物实体类
 * @author 梁城月
 *
 */
@Entity
public class Goods {
	/**
	 * id
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	/**
	 * 订单号
	 */
	@Column(length = 50)
	private String orderNumber;
	/**
	 * 取货编号
	 */
	@Column(length = 50)
	private String takeNo;
	/**
	 * 取货地址ַ
	 */
	@Column(length = 350)
	private String pickupAddress;
	/**
	 * 预留号码
	 */
	@Column(length = 50)
	private String reservedNumber;
	/**
	 * 所属订单
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "preOrderId")
	private Order order;

	/**
	 *获取ID
	 * 
	 * @return ID
	 */
	public String getId() {
		return id;
	}

	/**
	 *设置ID
	 * 
	 * @param id
	 *            ID
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 获取订单号
	 * 
	 * @return 订单号
	 */
	public String getOrderNumber() {
		return orderNumber;
	}

	/**
	 * 设置订单号
	 * 
	 * @param orderNumber 订单号
	 */
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	/**
	 * 获取取货号
	 * 
	 * @return 取货号
	 */
	public String getTakeNo() {
		return takeNo;
	}

	/**
	 * 设置取货号
	 * 
	 * @param takeNo 取货号
	 */
	public void setTakeNo(String takeNo) {
		this.takeNo = takeNo;
	}

	/**
	 * 获取取货地址ַ
	 * 
	 * @return 取货地址ַ
	 */
	public String getPickupAddress() {
		return pickupAddress;
	}

	/**
	 * 设置取货地址ַ
	 * 
	 * @param pickupAddress 取货地址ַ
	 */
	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}

	/**
	 * 获取预留号码
	 * 
	 * @return 预留号码
	 */
	public String getReservedNumber() {
		return reservedNumber;
	}

	/**
	 * 设置预留号码
	 * 
	 * @param reservedNumber
	 *            预留号码
	 */
	public void setReservedNumber(String reservedNumber) {
		this.reservedNumber = reservedNumber;
	}

	/**
	 * 获取所属订单
	 * 
	 * @return 所属订单
	 */
	public Order getOrder() {
		return order;
	}

	/**
	 * 设置所属订单
	 * 
	 * @param order 所属订单
	 */
	public void setOrder(Order order) {
		this.order = order;
	}

}

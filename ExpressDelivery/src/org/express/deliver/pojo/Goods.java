package org.express.deliver.pojo;

import java.util.Date;
import java.util.List;

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
 * 
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
	 * 寄件人姓名
	 */
	@Column(length = 50)
	private String senderName;
	/**
	 * 快递名称
	 */
	@Column(length = 50)
	private String expressName;
	public String getExpressName() {
		return expressName;
	}

	public void setExpressName(String expressName) {
		this.expressName = expressName;
	}

	/**
	 * 寄件人预留号码
	 */
	@Column(length = 50)
	private String senderPhoneNumber;
	/**
	 * 寄件人地址ַ
	 */
	@Column(length = 350)
	private String senderAddress;
	/**
	 * 收件人姓名
	 */
	@Column(length = 50)
	private String addresseeName;
	/**
	 * 收件人预留号码
	 */
	@Column(length = 50)
	private String addresseePhoneNumber;
	/**
	 * 收件人地址ַ
	 */
	@Column(length = 350)
	private String addresseeAddress;
	/**
	 * 到站时间
	 */
	@Column()
	private Date arrivalTimeDate;
	/**
	 * 离站时间
	 */
	@Column()
	private Date leaveTimeDate;
	/**
	 * 货物状态
	 */
	@Column(length = 50)
	private String state;

	/**
	 * 所属订单
	 */
	/*
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "preOrderId")
	private Order order;*/

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderPhoneNumber() {
		return senderPhoneNumber;
	}

	public void setSenderPhoneNumber(String senderPhoneNumber) {
		this.senderPhoneNumber = senderPhoneNumber;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public String getAddresseeName() {
		return addresseeName;
	}

	public void setAddresseeName(String addresseeName) {
		this.addresseeName = addresseeName;
	}

	public String getAddresseePhoneNumber() {
		return addresseePhoneNumber;
	}

	public void setAddresseePhoneNumber(String addresseePhoneNumber) {
		this.addresseePhoneNumber = addresseePhoneNumber;
	}

	public String getAddresseeAddress() {
		return addresseeAddress;
	}

	public void setAddresseeAddress(String addresseeAddress) {
		this.addresseeAddress = addresseeAddress;
	}

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
	 * @param orderNumber
	 *            订单号
	 */
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}




	/**
	 * 获取到站时间
	 * 
	 * @return 到站时间
	 */
	public Date getArrivalTimeDate() {
		return arrivalTimeDate;
	}

	/**
	 * 设置到站时间
	 * 
	 * @param arrivalTimeDate
	 *            到站时间
	 */
	public void setArrivalTimeDate(Date arrivalTimeDate) {
		this.arrivalTimeDate = arrivalTimeDate;
	}

	/**
	 * 获取离站时间
	 * 
	 * @return 离站时间
	 */
	public Date getLeaveTimeDate() {
		return leaveTimeDate;
	}

	/**
	 * 设置离站时间
	 * 
	 * @param leaveTimeDate
	 *            离站时间
	 */
	public void setLeaveTimeDate(Date leaveTimeDate) {
		this.leaveTimeDate = leaveTimeDate;
	}

	/**
	 * 获取货物状态
	 * 
	 * @return 货物状态
	 */
	public String getState() {
		return state;
	}

	/**
	 * 设置货物状态
	 * 
	 * @param state
	 *            货物状态
	 */
	public void setState(String state) {
		this.state = state;
	}



	/**
	 * 获取所属订单
	 * 
	 * @return 所属订单
	 *//*
	public Order getOrder() {
		return order;
	}

	*//**
	 * 设置所属订单
	 * 
	 * @param order
	 *            所属订单
	 *//*
	public void setOrder(Order order) {
		this.order = order;
	}
*/
	/**
	 * 将List<Goods>集合转换为json数组
	 * 
	 * @param gList
	 *            List<Goods>集合
	 * @return json数组
	 */
	/*public static String getGoodsListJson(List<Goods> gList) {
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append("[");
		for (Goods goods : gList) {
			sBuffer.append("{");
			sBuffer.append("\"id\":");
			sBuffer.append("\"" + goods.getId() + "\"");
			sBuffer.append(",");
			sBuffer.append("\"orderNumber\":");
			sBuffer.append("\"" + goods.getOrderNumber() + "\"");
			sBuffer.append(",");
			sBuffer.append("\"pickupAddress\":");
			sBuffer.append("\"" + goods.getPickupAddress() + "\"");
			sBuffer.append(",");
			sBuffer.append("\"reservedNumber\":");
			sBuffer.append("\"" + goods.getReservedNumber() + "\"");
			sBuffer.append(",");
			sBuffer.append("\"takeNo\":");
			sBuffer.append("\"" + goods.getTakeNo() + "\"");
			sBuffer.append("}");
			sBuffer.append(",");
		}
		sBuffer.replace(sBuffer.length() - 1, sBuffer.length(), "");
		sBuffer.append("]");
		return sBuffer.toString();
	}*/
}

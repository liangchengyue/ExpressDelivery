package org.express.deliver.pojo;

import java.util.Date;
import java.util.HashSet;
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

import org.hibernate.annotations.GenericGenerator;

/**
 * 评论实体类
 * 
 * @author 梁城月
 * 
 */
@Entity
public class Comment {
	/**
	 * id
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	/**
	 * 评论等级
	 */
	@Column(nullable = false)
	private Integer grade;
	/**
	 * 内容
	 */
	@Column(length = 400)
	private String content;
	/**
	 * 评论时间
	 */
	@Column(nullable = false)
	private Date commentDate;
	/**
	 * 所属订单
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "orderId")
	private Order order;
	/**
	 * 回复列表
	 */
	@OneToMany(mappedBy = "comment", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("id ASC")
	private Set<Reply> replies = new HashSet<Reply>();

	/**
	 * 获取ID
	 * 
	 * @return id
	 */
	public String getId() {
		return id;
	}

	/**
	 * 设置id
	 * 
	 * @param id
	 *            id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 获取评论等级
	 * 
	 * @return 评论等级
	 */
	public Integer getGrade() {
		return grade;
	}

	/**
	 * 设置评论等级
	 * 
	 * @param grade
	 *            评论等级
	 */
	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	/**
	 * 获取评论内容
	 * 
	 * @return 评论内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置评论内容
	 * 
	 * @param content
	 *            评论内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取评论时间
	 * 
	 * @return评论时间
	 */
	public Date getCommentDate() {
		return commentDate;
	}

	/**
	 * 设置评论时间
	 * 
	 * @param commentDate评论时间
	 */
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
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
	 * @param order所属订单
	 */
	public void setOrder(Order order) {
		this.order = order;
	}

	/**
	 * 获取回复列表
	 * 
	 * @return 回复列表
	 */
	public Set<Reply> getReplies() {
		return replies;
	}

	/**
	 * 设置回复列表
	 * 
	 * @param replies
	 *            回复列表
	 */
	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

}

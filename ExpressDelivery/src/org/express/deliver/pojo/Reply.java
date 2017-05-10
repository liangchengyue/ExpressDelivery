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
 * 回复实体类
 * @author 梁城月
 *
 */
@Entity
public class Reply {
	/**
	 * id
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	/**
	 * 回复内容
	 */
	@Column(length = 400, nullable = false)
	private String content;
	/**
	 * 回复时间
	 */
	@Column(nullable = false)
	private Date replyDate;
	/**
	 * 所属评论
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "commentId")
	private Comment comment;

	/**
	 * 设置ID
	 * 
	 * @return ID
	 */
	public String getId() {
		return id;
	}

	/**
	 *获取ID
	 * 
	 * @param id
	 *            ID
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 *获取回复内容
	 * 
	 * @return 回复内容
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置回复内容
	 * 
	 * @param content
	 *           回复内容
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 获取回复时间
	 * 
	 * @return 回复时间
	 */
	public Date getReplyDate() {
		return replyDate;
	}

	/**
	 * 设置回复时间
	 * 
	 * @param replyDate
	 *            回复时间
	 */
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	/**
	 * 获取所属评论
	 * 
	 * @return 所属评论
	 */
	public Comment getComment() {
		return comment;
	}

	/**
	 * 设置所属评论
	 * 
	 * @param comment
	 *            所属评论
	 */
	public void setComment(Comment comment) {
		this.comment = comment;
	}

}

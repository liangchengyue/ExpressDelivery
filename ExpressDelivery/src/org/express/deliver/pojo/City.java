package org.express.deliver.pojo;

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

import org.hibernate.annotations.GenericGenerator;

/**
 * 区域实体类
 * 
 * @author 梁城月
 * 
 */
@Entity
public class City {
	/**
	 * id
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	/**
	 * 区域名称
	 */
	@Column(nullable = false)
	private String name;
	/**
	 * 所属区域
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "parentId")
	private City city;
	/**
	 * 区域列表
	 */
	@OneToMany(mappedBy = "city", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("id ASC")
	private Set<City> cities = new HashSet<City>();

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
	 * 获取区域名称
	 * 
	 * @return 区域名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置区域名称
	 * 
	 * @param name
	 *            区域名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取所属区域
	 * 
	 * @return 所属区域
	 */
	public City getCity() {
		return city;
	}

	/**
	 * 设置所属区域
	 * 
	 * @param city
	 *            所属区域
	 */
	public void setCity(City city) {
		this.city = city;
	}

	/**
	 * 获取区域列表
	 * 
	 * @return 区域列表
	 */
	public Set<City> getCities() {
		return cities;
	}

	/**
	 * 设置区域列表
	 * 
	 * @param cities
	 *            区域列表
	 */
	public void setCities(Set<City> cities) {
		this.cities = cities;
	}
	/**
	 * 将List<City>集合转换为json数组
	 * @param cList List<City>集合
	 * @return json数组
	 */
	public static String getCityListJson(List<City> cList){
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("[");
		for (City city : cList) {
			sBuffer.append("{");
			sBuffer.append("\"id\":");
			sBuffer.append("\""+city.getId()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"name\":");
			sBuffer.append("\""+city.getName()+"\"");
			sBuffer.append(",");
			sBuffer.append("\"parentName\":");
			sBuffer.append("\""+city.getCity().getName()+"\"");
			sBuffer.append("}");
			sBuffer.append(",");
		}
		sBuffer.replace(sBuffer.length()-1, sBuffer.length(), "");
		sBuffer.append("]");
		return sBuffer.toString();
	}
}

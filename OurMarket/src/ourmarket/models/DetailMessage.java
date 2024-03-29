package ourmarket.models;

import java.sql.Timestamp;

/**
 * DetailMessage entity. @author MyEclipse Persistence Tools
 */

public class DetailMessage implements java.io.Serializable {

	// Fields

	private Long dmId;
	private Integer mid;
	private String mcontent;
	private Timestamp mtime;

	// Constructors

	/** default constructor */
	public DetailMessage() {
	}

	/** minimal constructor */
	public DetailMessage(String mcontent, Timestamp mtime) {
		this.mcontent = mcontent;
		this.mtime = mtime;
	}

	/** full constructor */
	public DetailMessage(Integer mid, String mcontent, Timestamp mtime) {
		this.mid = mid;
		this.mcontent = mcontent;
		this.mtime = mtime;
	}

	// Property accessors

	public Long getDmId() {
		return this.dmId;
	}

	public void setDmId(Long dmId) {
		this.dmId = dmId;
	}

	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMcontent() {
		return this.mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Timestamp getMtime() {
		return this.mtime;
	}

	public void setMtime(Timestamp mtime) {
		this.mtime = mtime;
	}

}
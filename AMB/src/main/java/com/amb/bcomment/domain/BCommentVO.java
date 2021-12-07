package com.amb.bcomment.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BCommentVO {
	public long cno;
	public long bno;
	public String mid;
	public Date cregDate;
	public String ccontent;
	public long creply;
	public int cdelflag;
	public int lvl;
}

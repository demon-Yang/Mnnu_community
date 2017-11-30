package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Notes;

@Repository
public interface NotesDao {
	//查询所有留言 
	public List<Notes> queryAll();
	//按UID查询个人留言
	public List<Notes> queryOne(@Param("uid")int uid);
	//发表留言
	public int insert(Notes notes);
}

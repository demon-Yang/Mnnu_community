package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.NotesDao;
import com.yxd.entity.Notes;

@Service
public class NotesService {
	@Resource
	private NotesDao notesDao;
		//查询所有留言 
		public List<Notes> queryAll(){
			return notesDao.queryAll();
		}
		//按日期查询所有留言 
		public List<Notes> queryByDate(String ndate){
			return notesDao.queryByDate(ndate);
		}
		//按UID查询个人留言
		public Notes queryOne(int uid){
			return notesDao.queryOne(uid);
		}
		//发表留言
		public int insert(Notes notes) {
			return notesDao.insert(notes);
		}
}

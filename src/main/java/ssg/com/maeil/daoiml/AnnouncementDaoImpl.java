package ssg.com.maeil.daoiml;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.AnnouncementDao;
import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;

@Repository
public class AnnouncementDaoImpl implements AnnouncementDao{

	@Autowired
	SqlSession session;

	String ns = "Announcement";
	@Override
	public int announcementInsert(AnnouncementDto dto) {		
		return session.insert(ns+"announcementInsert",dto);
	}
	@Override
	public List<AnnouncementDto> announcementList(AnnouncementSearch Annsearch) {
		return session.selectList(ns+"announcementList",Annsearch);
	}
	@Override
	public int getallannouncement(AnnouncementSearch Annsearch) {
		return session.selectOne(ns+"getallannouncement", Annsearch);
	}


	
	
}

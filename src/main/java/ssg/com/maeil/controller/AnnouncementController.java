package ssg.com.maeil.controller;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;
import ssg.com.maeil.service.AnnouncementService;

@Controller
public class AnnouncementController {

	@Autowired
	AnnouncementService service;
	
	@GetMapping("announcementmain.do")
	public String announcementList(AnnouncementSearch Annsearch,Model model) {
		System.out.println("AnnouncementController announcement() " + new Date());
		if(Annsearch == null || Annsearch.getSearch() == null || Annsearch.getChoice() == null) {
			Annsearch = new AnnouncementSearch("", "", 0);
		}
		
		List<AnnouncementDto> list = service.announcementList(Annsearch);
				
		// 글의 총수
		int count = service.getallannouncement(Annsearch);	
		// 페이지를 계산
		int annPage = count / 10;
		if((count % 10) > 0) {
			annPage = annPage + 1;
		}		
		
		model.addAttribute("announcementList", list);
		model.addAttribute("annPage", annPage);
		model.addAttribute("Annsearch", Annsearch);
		
		
		return "announcementmain";
	}
	@GetMapping("announcementinsert.do")
	public String announcementinsert(){
		System.out.println("AnnouncementController announcementinsert() " + new Date());
		return "announcementinsert";
	}
	@PostMapping("announcementinsertAf.do")
	public String announcementinsertAf(AnnouncementDto dto,Model model) {
		System.out.println("AnnouncementController announcementinsertAf() " + new Date());
		boolean isS = service.announcementInsert(dto);
		String insertmessage = "작성완료했습니다.";
		if(isS==false) {
			insertmessage ="작성실패했습니다.";
		}
		return "message";
	}
	

}

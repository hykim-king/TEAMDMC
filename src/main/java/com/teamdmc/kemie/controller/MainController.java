package com.teamdmc.kemie.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.teamdmc.kemie.cmn.SearchVO;
import com.teamdmc.kemie.cmn.StringUtil;
import com.teamdmc.kemie.navernews.Item;
import com.teamdmc.kemie.navernews.NaverService;

@Controller("mainController")
public class MainController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	NaverService naverService;
	
	public MainController() {}

	@RequestMapping(value="/mainPage.do")  
	public String mainPage(Model model) throws SQLException {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		List<Item> list = naverService.doRetrieve();
		
		model.addAttribute("list", list);
		
		return "mainPage";
	}
	
	@RequestMapping(value="/newsDetail.do", method=RequestMethod.GET)
	public String newsDetail(Item item, SearchVO searchVO, HttpServletRequest req)throws SQLException{
		String jsonString = "";
		
		LOG.debug("==============");
		LOG.debug("newsDetail");
		LOG.debug("==============");
		
		//페이지 사이즈
        if(0 == searchVO.getPageSize()) {
    	    searchVO.setPageSize(10);
        }
      
        //페이지 번호
        if(0 == searchVO.getPageNum()) {
    	    searchVO.setPageNum(1);
        }
       
        //검색어
        if(null == searchVO.getSearchWord()) {
    	    searchVO.setSearchWord(StringUtil.nvl(searchVO.getSearchWord(), ""));
        }
        
        String pageSize = req.getParameter("pageSize");
        String pageNum = req.getParameter("pageNum");
        
        List<Item> list = naverService.doRetrieve();
        
        jsonString = new Gson().toJson(list);
		
		int totalCnt = 5;
		
		//총글수 : paging사용
		//pageTotal : 총 페이지 수
		double pageTotal = 0;
				
		if(null != list && list.size() > 0) {
			
			pageTotal = Math.ceil(totalCnt/(searchVO.getPageSize()* 1.0));
			
			LOG.debug("==============================");
			LOG.debug("pageTotal : "+ pageTotal);
			LOG.debug("==============================");
		}
		
		///WEB-INF/views/user/user_mng.jsp
		
		return jsonString;
		
	}
	
	
	
}

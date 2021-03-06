package com.teamdmc.kemie.user;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.cmn.SearchVO;
import com.teamdmc.kemie.dao.UserDao;
import com.teamdmc.kemie.user.domain.UserVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) //JUnit기능을 스프링 프레임으로 확장!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		                           "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"		
}) //applicationContext.xml loading
public class JunitUserControllerTest {
	
	final Logger LOG = LogManager.getLogger(this.getClass());
	
	@Autowired
	WebApplicationContext webApplicationContext;
	
	//브라우저 대역(Mock)
	MockMvc mockMvc;
	
	  @Autowired
	  UserDao dao;
	  UserVO  user01;
	  UserVO  user02;
	  UserVO  user03;
	  
	  SearchVO searchVO;
	
	  @Before
	  public void setUp()throws Exception{
		  LOG.debug("====================");
		  LOG.debug("=0.setUp()=");
		  LOG.debug("====================");
		  searchVO = new SearchVO(10, 1, "", "");
		  
		  user01 = new UserVO("no1","1234", "teamDMC1", "010-1234-5678", "닉네임1", "1", "날짜_사용_안_함");
		  user02 = new UserVO("no2","1234", "teamDMC2", "010-1234-5678", "닉네임2", "0", "날짜_사용_안_함");
		  user03 = new UserVO("no3","1234", "teamDMC3", "010-1234-5678", "닉네임3", "0", "날짜_사용_안_함");
		  
		  mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		  LOG.debug("webApplicationContext : "+ webApplicationContext);
		  LOG.debug("mockMvc : "+ mockMvc);
		  
		  assertNotNull(webApplicationContext);
		  assertNotNull(mockMvc);
	  }
	  
	  @Test
	  @Ignore
	  public void idCheck() throws Exception{
		  //1. 기존데이터 삭제
		  //2. 한 건 입력
		  //3. idCheck()
		  
		  //1.
		  dao.doDelete(user01);
		  dao.doDelete(user02);
		  dao.doDelete(user03);
		  
		  //2.
		  dao.doInsert(user01);
		  assertEquals(1, dao.getCount(user01));
		  
		  //호출url, param, 호출방식(get/post)
		  //GET방식으로 : http://localhost:8081/ehr/user/doSelectOne.do?uId=p12
		  MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.
				  get("/idCheck.do").param("uId", user01.getuId());
		 //대역 객체 통해 호출
		  ResultActions resultActions = mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());
		  String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		  
		  LOG.debug("====================");
		  LOG.debug("result : "+ result);
		  LOG.debug("====================");
		  
		  //jsonString to VO
		  //Gson gson = new Gson();
		  //MessageVO messageVO = gson.fromJson(result, MessageVO.class);
		  //LOG.debug("====================");
		  //LOG.debug("messageVO : "+ messageVO);
		  //LOG.debug("====================");
		  
	      //assertEquals("1", messageVO.getMsgId());
		  
	  }
	  
	  @Test
	  @Ignore
	  public void doRetrieve() throws Exception{
		  //호출url, param, 호출방식(get/post)
		  searchVO.setSearchDiv("10");
		  //searchVO.setSearchWord("p12");
		  
		  MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/doRetrieve.do")
				  .param("pageSize", String.valueOf(searchVO.getPageSize()))
				  .param("pageNum", String.valueOf(searchVO.getPageNum()))
				  .param("SearchDiv", searchVO.getSearchDiv())
				  .param("SearchWord", searchVO.getSearchWord());
						  
		  //대역 객체 통해 호출
		  ResultActions resultActions = mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());
		  String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();		  
		 
		  LOG.debug("====================");
		  LOG.debug("result : "+ result);
		  LOG.debug("====================");	
		  
		  //jsonString to List<UserVO>
		  Gson gson = new Gson();
		  //gson  List<UserVO> jsonString -> List<UserVO>
		  List<UserVO> list = gson.fromJson(result, new TypeToken<List<UserVO>>() {}.getType());
		  
		  for(UserVO vo :list) {
			  LOG.debug("vo : "+ vo);
		  }
	  }
	  
	  @Test
	  @Ignore
	  public void doUpdate() throws Exception{
		  //1. 기존 데이터 삭제
		  //2. 단건입력
		  //3. 수정
		  //4. 비교
		  
		  //1.
		  doDelete(user01);
		  doDelete(user02);
		  doDelete(user03);
		  
		  //2.
		  add(user01);
		  assertEquals(1, this.dao.getCount(user01));
		  
		  //3.
		  UserVO outVO01 = doSelectOne(user01);
		  isSameUser(outVO01, user01);
		  
		  String modifyStr = "_U";
		
		  user01.setPasswd(user01.getPasswd()+modifyStr);
		  user01.setName(user01.getName()+modifyStr);
		  user01.setpNum(user01.getpNum()+modifyStr);
		  user01.setNick(user01.getNick()+modifyStr);
		  user01.setType(user01.getType());
		  user01.setRegDt(user01.getRegDt());
		  
		//호출url, param, 호출방식(get/post)
		  MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/doUpdate.do")
				  .param("uId",user01.getuId())		  
				  .param("passwd",user01.getPasswd())		  
				  .param("name",user01.getName())		  
				  .param("pNum", user01.getpNum())	  
				  .param("nick", user01.getNick())		  
				  .param("type",user01.getType())		  
				  .param("regDt",user01.getRegDt());
		//대역 객체 통해 호출
		  ResultActions resultActions = mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());
		  String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();		  
		 
		  LOG.debug("====================");
		  LOG.debug("result : "+ result);
		  LOG.debug("====================");	
		  
		  //jsonString to VO
		  Gson gson = new Gson();
		  MessageVO messageVO = gson.fromJson(result, MessageVO.class);
		  LOG.debug("====================");
		  LOG.debug("messageVO : "+ messageVO);
		  LOG.debug("====================");
		  
		  assertEquals("1", messageVO.getMsgId());
		  
		  UserVO vsVO01 = doSelectOne(user01);
		  isSameUser(vsVO01, user01);
	  }
	  
	  @Test
	  public void addAndGet() throws Exception{
		//1. 기존데이터 삭제
		//2. 신규데이터 등록
	    //3. 단건데이터 조회
		//4. 등록데이터와 비교
		  
		  //1.
		  doDelete(user01);
		  doDelete(user02);
		  doDelete(user03);
		  
		  //2.
		  add(user01);
		  assertEquals(1, this.dao.getCount(user01));
		  
		  add(user02);
		  assertEquals(2, this.dao.getCount(user01));
		  
		  add(user03);
		  assertEquals(3, this.dao.getCount(user01));
		  
		  //3.
		  UserVO outVO01 = doSelectOne(user01);
		  isSameUser(outVO01, user01);
		  
		  UserVO outVO02 = doSelectOne(user02);
		  isSameUser(outVO02, user02);
		  
		  UserVO outVO03 = doSelectOne(user03);
		  isSameUser(outVO03, user03);
	  }
	  
	  private void isSameUser(UserVO vsVO, UserVO orgVO) {
		  assertEquals(vsVO.getuId(), orgVO.getuId());
		  assertEquals(vsVO.getPasswd(), orgVO.getPasswd());
		  assertEquals(vsVO.getName(), orgVO.getName());
		  
		  assertEquals(vsVO.getpNum(),orgVO.getpNum());
		  assertEquals(vsVO.getNick(),orgVO.getNick());
		  assertEquals(vsVO.getType(),orgVO.getType());
		  assertEquals(vsVO.getRegDt(),orgVO.getRegDt());
	  }
	  
	  //@Test
	  //public void add() throws Exception{
	  public void add(UserVO user01) throws Exception{
		  //호출url, param, 호출방식(get/post)
		  //GET방식으로 : http://localhost:8081/ehr/user/add.do?uId=p12
		  MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/user/add.do")
				  .param("uId",user01.getuId())		  
				  .param("passwd",user01.getPasswd())		  
				  .param("name",user01.getName())		  
				  .param("pNum", user01.getpNum())	  
				  .param("nick", user01.getNick())		  
				  .param("type",user01.getType())		  
				  .param("regDt",user01.getRegDt());
		  //대역 객체 통해 호출
		  ResultActions resultActions = mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());
		  String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		  
		  LOG.debug("====================");
		  LOG.debug("result : "+ result);
		  LOG.debug("====================");	
		  
		  //jsonString to VO
		  Gson gson = new Gson();
		  MessageVO messageVO = gson.fromJson(result, MessageVO.class);
		  LOG.debug("====================");
		  LOG.debug("messageVO : "+ messageVO);
		  LOG.debug("====================");	  
		  
	  }
	  
	  //@Test
	  //@Ignore
	  //public void doDelete() throws Exception{
	  public void doDelete(UserVO user) throws Exception{
		  //호출url, param, 호출방식(get/post)
		  //GET방식으로 : http://localhost:8081/ehr/user/doDelete.do?uId=p12
		  MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doDelete.do")
				  .param("uId",user.getuId());
		  
		  //대역 객체 통해 호출
		  ResultActions resultActions = mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());
		  
		  String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		  
		  LOG.debug("====================");
		  LOG.debug("result : "+ result);
		  LOG.debug("====================");
		  
		  //jsonString to VO
		  Gson gson = new Gson();
		  MessageVO messageVO = gson.fromJson(result, MessageVO.class);
		  LOG.debug("====================");
		  LOG.debug("messageVO : "+ messageVO);
		  LOG.debug("====================");
		  
	  }
	  
	  //@Test
	  //@Ignore
	  //public void doSelectOne() throws Exception {
	  public UserVO doSelectOne(UserVO user) throws Exception {
		  //호출url, param, 호출방식(get/post)
		  //GET방식으로 : http://localhost:8081/ehr/user/doSelectOne.do?uId=p12
		  MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/user/doSelectOne.do")
				  .param("uId", user.getuId());
		  
		  ResultActions resultActions =  mockMvc.perform(requestBuilder)
				  .andExpect(status().isOk());
		  
		  String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		  LOG.debug("====================");
		  LOG.debug("result : "+ result);
		  LOG.debug("====================");
		  
		  Gson gson = new Gson();
		  //gson string to UserVO
		  UserVO outVO = gson.fromJson(result, UserVO.class);
		  
		  return outVO;
		  
	  }	
	
}

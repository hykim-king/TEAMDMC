package com.pcwk.ehr;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@FixMethodOrder(MethodSorters.NAME_ASCENDING) // 테스트 메소드 수행 순서를 a-Z순으로 작동
@RunWith(SpringJUnit4ClassRunner.class) // Junit의 기능을 Spring으로 확대시킴.
@ContextConfiguration(locations = "/applicationContext.xml") // ContextConfiguration을 통해 applicationContext.xml을 로딩하여 공유
public class JunitUserServiceTest {
	final Logger LOG = LogManager.getLogger(this.getClass());
	
	@Autowired // Context Framework는 변수 타입과 일치하는 Context 내의 Bean을 찾고, 변수에 주입(할당)
	ApplicationContext context;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserDao dao;
	
	List<UserVO> list;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("============================");
		LOG.debug("=0. setUp()=");
		LOG.debug("============================");
		
		/*
		 * 사용자 레벨 BASIC, SILVER, GOLD
		 * 사용자가 처음 가입 할 시: BASIC
		 * 가입 이후 50회 이상 로그인 할 시: SILVER
		 * SILVER 레벨이면서 30번 이상 추천을 받으면 GOLD로 level UP
		 * 사용자 레벨의 변경 작업은 일정한 주기를 가지고 일괄 처리(트랜재션관리).
		 */
		list = Arrays.asList(
					new UserVO("p09", "김태욱09", "4321", Level.BASIC, 49, 0, "zzxsx484@gmail.com", "날짜_사용_안_함") // BASIC
					,new UserVO("p090", "김태욱090", "4321", Level.BASIC, 50, 10, "zzxsx484@gmail.com", "날짜_사용_안_함") // BASIC->SILVER
					,new UserVO("p0900", "김태욱0900", "4321", Level.SILVER, 51, 29, "zzxsx484@gmail.com", "날짜_사용_안_함") // SILVER->SILVER
					,new UserVO("p09000", "김태욱09000", "4321", Level.SILVER, 51, 30, "zzxsx484@gmail.com", "날짜_사용_안_함") // SILVER->GOLD
					,new UserVO("p090000", "김태욱090000", "4321", Level.GOLD, 52, 31, "zzxsx484@gmail.com", "날짜_사용_안_함") // GOLD
				);
		
		LOG.debug("context: "+context);
		LOG.debug("userService: "+userService);
		LOG.debug("dao: "+dao);
		
		assertNotNull(context);
		assertNotNull(userService);
		assertNotNull(dao);
	}
	
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void add() throws SQLException{
		LOG.debug("============================");
		LOG.debug("=2.add()=");
		LOG.debug("============================");
		/* add() 테스트 시나리오
		 * 1. 전체 삭제 
		 * 2. 조건식
		 *     2-1. Level이 있는 경우
		 *     2-2. Level이 null인 경우
		 * 3. 각각 데이터 추가
		 * 4. 각각 데이터 조회
		 * 5. 비교
		 */
		
		// [1] 데이터 전체 삭제(본인 데이터만)
		for(UserVO user : list) {
			this.dao.doDelete(user);
		}
		
		// [2] 조건식
		//     [2-1] Level이 NULL인 경우
		UserVO userWithoutLevel = list.get(0);
		userWithoutLevel.setLevel(null); // list의 0번째 index 요소의 level 값을 null로 변경(BASIC -> NULL)
		//     [2-2] Level이 NULL이 아닌 경우(그대로 통과)
		UserVO userWithLevel = list.get(4);
		
		// [3] 각각 데이터 추가
		//     [3-1] level이 null인 데이터 삽입
		userService.add(userWithoutLevel);
		assertEquals(1, dao.getCount(list.get(0)));
		//     [3-2] level이 null이 아닌 데이터 삽입
		userService.add(userWithLevel);
		assertEquals(2, dao.getCount(list.get(0)));
		
		// [4] 각각 데이터 조회
		//	     [4-1] level이 null인 데이터 조회
		UserVO userWithoutLevelRead = this.dao.doSelectOne(userWithoutLevel);
		checkLevel(userWithoutLevelRead, Level.BASIC);
		//	     [4-2] level이 null이 아닌 데이터 조회
		UserVO userWithLevelRead = this.dao.doSelectOne(userWithLevel);
		checkLevel(userWithLevelRead, Level.GOLD);
	}
	
	@Test
	public void upgradeLevels() throws SQLException {
		LOG.debug("============================");
		LOG.debug("=1.upgradeLevels()=");
		LOG.debug("============================");
		/* upgradeLevels() 테스트 시나리오
		 * 1. 전체 삭제 
		 * 2. 데이터 입력
		 * 3. 등업
		 * 4. 등업 데이터 비교
		 */
		
		// [1] 데이터 전체 삭제(본인 데이터만)
		for(UserVO user : list) {
			this.dao.doDelete(user);
		}
		
		// [2] 데이터 입력
		for(UserVO user : list) {
			dao.doInsert(user);
		}
		assertEquals(5,  dao.getCount(list.get(0)));
		
		// [3] 등업
		this.userService.upgradeLevels(list.get(0));
		
		// [4] 등업 데이터 비교
		checkLevel(list.get(0), Level.BASIC);
		checkLevel(list.get(1), Level.SILVER);
		checkLevel(list.get(2), Level.SILVER);
		checkLevel(list.get(3), Level.GOLD);
		checkLevel(list.get(4), Level.GOLD);
	}
	
	private void checkLevel(UserVO user, Level expectedLevel) throws SQLException{
		// DB에 있는 데이터 조회
		UserVO upUser = dao.doSelectOne(user);
		LOG.debug(upUser.getLevel()+"==="+expectedLevel);
		assertEquals(upUser.getLevel(), expectedLevel);
	}
}
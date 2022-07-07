package com.teamdmc.kemie.user.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamdmc.kemie.cmn.DTO;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.dao.UserDao;
import com.teamdmc.kemie.user.domain.UserVO;

@Service("userService")
public class userServiceImpl implements userService {

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	private UserDao userDao;
	
	public userServiceImpl() {}

	@Override
	public int passCheck(UserVO inVO) throws SQLException {
		return this.userDao.passCheck(inVO);
	}

	@Override
	public int doPassUpdate(UserVO inVO) throws SQLException {
		return this.userDao.doPassUpdate(inVO);
	}

	@Override
	public int doNickUpdate(UserVO inVO) throws SQLException {
		return this.userDao.doNickUpdate(inVO);
	}

	@Override
	public int loginCheck(UserVO inVO) throws SQLException {
		return this.userDao.loginCheck(inVO);
	}

	@Override
	public int nickCheck(UserVO inVO) throws SQLException {
		return this.userDao.nickCheck(inVO);
	}

	@Override
	public int idCheck(UserVO inVO) throws SQLException {
		return userDao.idCheck(inVO);
	}

	@Override
	public List<UserVO> doRetrieve(DTO dto) throws SQLException {
		return userDao.doRetrieve(dto);
	}

	@Override
	public int doDelete(UserVO inVO) throws SQLException {
		return userDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(UserVO inVO) throws SQLException {
		return userDao.doUpdate(inVO);
	}

	@Override
	public int doInsert(UserVO inVO) throws SQLException {
		return userDao.doInsert(inVO);
	}

	@Override
	public void deleteAll() throws SQLException {
		
	}

	@Override
	public int getCount(UserVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public List<UserVO> getAll(UserVO inVO) {
		return null;
	}

	@Override
	public UserVO doSelectOne(UserVO inVO) throws SQLException {
		return userDao.doSelectOne(inVO);
	}

	@Override
	public MessageVO idPassCheck(UserVO inVO) throws SQLException {
		
		 //msgId;//메시지 ID
		//1. ID확인 : 10
		//2. 비번확인: 20
		//3. id/비번 통과: 30
		MessageVO  message=new MessageVO();
		int flag = userDao.idCheck(inVO);
		if(1 != flag) {
			message.setMsgId("10");
			message.setMsgContents("아이디를  확인 하세요.\n"+inVO.getuId());
			return message;
		}
		
		flag = userDao.passCheck(inVO);
		if(1 != flag) {
			message.setMsgId("20");
			message.setMsgContents(inVO.getuId()+ "의 비번을 확인 하세요.");
			
			return message;
		}		
		
		message.setMsgId("30");
		message.setMsgContents(inVO.getuId()+ "의 아이디, 비번이 확인 되었습니다.");
		
		return message;
	}

}

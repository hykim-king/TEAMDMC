package com.teamdmc.kemie.user.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamdmc.kemie.cmn.DTO;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int nickCheck(UserVO inVO) throws SQLException {
		return this.userDao.nickCheck(inVO);
	}

	@Override
	public int idCheck(UserVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> doRetrieve(DTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int doDelete(UserVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doUpdate(UserVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doInsert(UserVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteAll() throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public int getCount(UserVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> getAll(UserVO inVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO doSelectOne(UserVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}

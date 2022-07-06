/**
* <pre>
* com.teamdmc.kemie.userinterested
* Class Name : UserinterestedServiceImpl.java
* Description:
* Author: Choi Jong Hee
* Since: 2022/07/05
* Version 0.1
* Copyright (c) by H.R.KIM All right reserved.
* Modification Information
* 수정일   수정자    수정내용
*-----------------------------------------------------
*2022/07/05 최초생성
*-----------------------------------------------------
* </pre>
*/
package com.teamdmc.kemie.userinterested;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamdmc.kemie.dao.BoardDao;
import com.teamdmc.kemie.dao.UserInterestedCoinDao;
import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

/**
 * @author Choi Jong Hee
 *
 */
@Service("UserinterestedService")
public class UserinterestedServiceImpl implements UserinterestedService {
	
final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	private UserInterestedCoinDao userInterestedCoinDao;

	@Override
	public int doDelete(UserInterestedVO inVO) throws SQLException {
		return userInterestedCoinDao.doDelete(inVO);
	}

	@Override
	public int doInsert(UserInterestedVO inVO) throws SQLException {
		return userInterestedCoinDao.doInsert(inVO);
	}

}

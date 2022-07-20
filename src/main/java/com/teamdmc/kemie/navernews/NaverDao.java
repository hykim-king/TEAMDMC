package com.teamdmc.kemie.navernews;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.cmn.SearchVO;

public interface NaverDao {
	
	/**
	 * 목록조회 
	 * @param dto
	 * @return List<NaverVO>
	 * @throws SQLException
	 */
	NaverSearchVO doRetrieve() throws SQLException;
}

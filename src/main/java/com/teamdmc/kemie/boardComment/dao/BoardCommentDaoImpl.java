package com.teamdmc.kemie.boardComment.dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamdmc.kemie.boardComment.domain.BoardCommentVO;
import com.teamdmc.kemie.cmn.DTO;


@Repository("boardCommentDao")
public class BoardCommentDaoImpl implements BoardCommentDao{

	final Logger LOG = LogManager.getLogger(this.getClass());
	final String NAMESPACE = "com.teamdmc.kemie.boardComment";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public BoardCommentDaoImpl() {}
	
	@Override
	public int doDelete(BoardCommentVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = this.NAMESPACE+".doDelete";		
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" +statement);
		LOG.debug("==============================");	
				
		flag = this.sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public int doUpdate(BoardCommentVO inVO) throws SQLException {
		int flag = 0;
        String statement =NAMESPACE+".doUpdate";	
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
	
		flag = sqlSessionTemplate.update(statement, inVO);
		
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public int doInsert(BoardCommentVO inVO) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE+".doInsert";
		
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
		
		flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public void deleteAll() throws SQLException {
		String statement = NAMESPACE+".deleteAll";
		
		LOG.debug("==============================");
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		sqlSessionTemplate.delete(statement);
		
	}

	@Override
	public int getCount(BoardCommentVO inVO) throws SQLException {
		int count = 0;

		String statement = this.NAMESPACE+".getCount";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		count =this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("==============================");
		LOG.debug("count=" + count);
		LOG.debug("==============================");			
	
		return count;
	}



	@Override
	public BoardCommentVO doSelectOne(BoardCommentVO inVO) throws SQLException {
		BoardCommentVO outVO = null;
		
		String statement = this.NAMESPACE +".doSelectOne";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		outVO = this.sqlSessionTemplate.selectOne(statement, inVO);		
		LOG.debug("==============================");
		LOG.debug("**outVO=" + outVO.toString());
		LOG.debug("==============================");

		return outVO;
	}


	@Override
	public List<BoardCommentVO> getAll(BoardCommentDao inVO) {
		List<BoardCommentVO> list= null;
	    String statement = NAMESPACE+".getAll";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		
		for(BoardCommentVO vo  :list) {
			LOG.debug("vo:"+vo.toString());
		}
		
		return list;
	}

	
	@Override
	public List<BoardCommentVO> doRetrieve(DTO dto) throws SQLException {
		return null;
	}

	
	@Override
	public List<BoardCommentVO> getAll(BoardCommentVO inVO) {
		List<BoardCommentVO> list= null;
	    String statement = NAMESPACE+".getAll";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		
		//list = jdbcTemplate.query(sb.toString(),rowMapper,args);
		
		for(BoardCommentVO vo  :list) {
			LOG.debug("vo:"+vo.toString());
		}
		
		return list;
	}
	
	
	
	

	}

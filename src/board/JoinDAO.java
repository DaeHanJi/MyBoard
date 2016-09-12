package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyAppSqlConfig;

public class JoinDAO {
	private static SqlSession session = null;
	public JoinDAO(){
		session = MyAppSqlConfig.getSqlSessionInstance();
	}
	public List<JoinVO> selectJoin(){
		List<JoinVO> list = session.selectList("board.JoinDAO.selectJoin");
		return list;
	}
	public JoinVO selectJoinOne(String userId){
		JoinVO join = session.selectOne("board.JoinDAO.selectJoinOne",userId);
		return join;
	}
	public int insertJoin(JoinVO join){
		int cnt = session.insert("board.JoinDAO.insertJoin",join);
		return cnt;
	}
	public int deleteJoin(String userId){
		int cnt = session.delete("board.JoinDAO.deleteJoin",userId);
		return cnt;
	}
	public void commitJoin(){
		session.commit();
	}
	public void rollbackJoin(){
		session.rollback();
	}
	public JoinVO emailJoin(){
		JoinVO join = new JoinVO();
		return join;
	}
}

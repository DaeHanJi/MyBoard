/**
 *  DAO : Date Access Object
 *  insert 
 *  update
 *  delete
 *  select
 */
package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyAppSqlConfig;

public class BoardDAO {
	private static SqlSession session = null;
	public BoardDAO () {
		session = MyAppSqlConfig.getSqlSessionInstance();
	}
	public int insertBoard(Board board) {
		session.insert("board.BoardDAO.insertBoard", board);
		session.commit();
		return board.getNo();
	}
	public int updateBoard(Board board) {
		int cnt = session.update("board.BoardDAO.updateBoard", board);
		session.commit();
		return cnt;
	}
	
	public int deleteBoard(int delNo) {
		int cnt = session.delete("board.BoardDAO.deleteBoard", delNo);
		session.commit();
		return cnt;		
	}
	
	public List<Board> selectBoard() {
		return session.selectList("board.BoardDAO.selectBoard");
	}
	/**
	 * 매개변수에 해당하는 글번호의 게시물을 반환하는 기능
	 * @param no
	 * @return  null 이 반환될 경우 해당 번호의 게시물이 존재하지 않는경우
	 *          null 이 아닌값이 반환된 경우는 해당 번호의 게시물을 찾은 경우
	 */
	public Board selectBoardByNo(int findNo) {
		return session.selectOne(
				"board.BoardDAO.selectBoardByNo", findNo);
	}
	public void insertFile(FileVO fvo){
		session.insert("board.BoardDAO.insertFile", fvo);
		session.commit();
	}
	public FileVO selectFile(int no){
		FileVO fvo = session.selectOne("board.BoardDAO.selectFile",no);
		return fvo;
	}
	public void insertCommit(CommitVO cvo){
		session.insert("board.BoardDAO.insertCommit",cvo);
		session.commit();
	}
	public List<CommitVO> selectCommit(int no){
		return session.selectList("board.BoardDAO.selectCommit", no);
	}
	public void deleteCommit(int comNo){
		session.delete("board.BoardDAO.deleteCommit",comNo);
		session.commit();
	}
	public void updateCommit(CommitVO commit){
		session.update("board.BoardDAO.updateCommit", commit);
		session.commit();
	}
}





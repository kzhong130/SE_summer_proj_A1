package dao;

import java.util.List;

import model.BookComment;

public interface BookCommentDao {
	public Integer save(BookComment bookComment);
	
	public void delete(BookComment bookComment);
	
	public void update(BookComment bookComment);
	
	public BookComment getBookCommentByID(int ID);
	
	public List<BookComment> getAllBookComments();
	
	public List<BookComment> getBookCommentsByISBN(String ISBN);	//得到的是没有被reject的评论
	
	public List<BookComment> getBookCommentsByUserName(String userName);
}

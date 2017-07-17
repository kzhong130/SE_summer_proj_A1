package dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.RequestBookDao;
import model.RequestBook;

public class RequestBookDaoImpl extends HibernateDaoSupport implements RequestBookDao{

	@Override
	public Integer save(RequestBook requestBook) {
		return (Integer)getHibernateTemplate().save(requestBook);
	}

	@Override
	public void delete(RequestBook requestBook) {
		getHibernateTemplate().delete(requestBook);
	}

	@Override
	public void update(RequestBook requestBook) {
		getHibernateTemplate().update(requestBook);
	}

	@Override
	public List<RequestBook> getProcessedRequest(String userName) {
		//List<RequestBook> RequestBookList = (List<RequestBook>)getHibernateTemplate().find("from requestBook as r where r.userName = ? and r.requestStatus != ?", userName,"waiting");
		List<RequestBook> RequestBookList = (List<RequestBook>)getHibernateTemplate().find("from RequestBook as r where r.userName = ? and r.requestStatus != ?", userName,"waiting");

		return RequestBookList;
	}
	
	public List<RequestBook> getAllRequestBooks(){
		return (List<RequestBook>)getHibernateTemplate().find("from RequestBook");
	}

}

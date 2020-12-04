package com.xf.dao;

import java.util.List;

import com.xf.entity.Book;
import com.xf.entity.PageBean;

public interface BookDao {
	 List<Book> getBookList(PageBean pageBean);

	    int getBookListByCount(PageBean pageBean);

	    Book getBookById(Integer id);
}

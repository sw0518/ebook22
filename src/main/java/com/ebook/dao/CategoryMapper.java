package com.ebook.dao;

import com.ebook.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("categoryMapper")
public interface CategoryMapper {
    List<Category> getAll();

}

package com.ebook.service.impl;

import com.ebook.dao.CategoryMapper;
import com.ebook.pojo.Category;
import com.ebook.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> getAll() {
        return this.categoryMapper.getAll();
    }
}

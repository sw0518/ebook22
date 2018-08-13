package com.ebook.service.impl;

import com.ebook.dao.EntryMapper;
import com.ebook.pojo.Entry;
import com.ebook.service.EntryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("entryService")
public class EntryServiceImpl implements EntryService{
    @Resource
    private EntryMapper entryMapper;


    @Override
    public int getTotalRecord(Entry entry) {
        return this.entryMapper.getTotalRecord(entry);
    }

    @Override
    public List<Entry> getInfosBypage(Entry entry) {
        return this.entryMapper.getInfosBypage(entry);
    }

    @Override
    public int save(Entry entry) {
        return this.entryMapper.save(entry);
    }

    @Override
    public int deleteOne(Integer id) {
        return this.entryMapper.deleteOne(id);
    }

    @Override
    public int update(Entry entry) {
        return this.entryMapper.update(entry);
    }

    @Override
    public Entry getInfo(Integer id) {
        return this.entryMapper.getInfo(id);
    }


}

package com.ebook.dao;

import com.ebook.pojo.Entry;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("entryMapper")
public interface EntryMapper {
    /**
     * 获得总记录数
     * @param entry
     * @return
     */
    public int getTotalRecord(Entry entry);

    /**
     * 进行分页查询
     * @param entry
     * @return
     */
    public List<Entry> getInfosBypage(Entry entry);

    /**
     * 增加图书信息
     * @param entry
     * @return
     */
    int save(Entry entry);

    /**
     * 删除单个数据
     * @param id
     * @return
     */
    int deleteOne(Integer id);


    /**
     * 修改内容
     * @param entry
     * @return
     */
    int update(Entry entry);

    /**
     * 查询单个信息
     * @param id
     * @return
     */
    Entry getInfo(Integer id);


}

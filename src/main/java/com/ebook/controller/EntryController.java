package com.ebook.controller;

import com.ebook.pojo.Category;
import com.ebook.pojo.Entry;
import com.ebook.service.CategoryService;
import com.ebook.service.EntryService;
import com.ebook.util.PageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/entry")
public class EntryController {
    @Resource
    private EntryService entryService;
    @Resource
    private CategoryService categoryService;

    @RequestMapping("/page")
    public String list(Model model, Entry entry){
        int totalRecord=entryService.getTotalRecord(entry);
        PageHelper pageHelper=new PageHelper(totalRecord,entry.getCurrentPage());
        pageHelper.setPageSize(entry.getPageSize());
        entry.setStratRecord(pageHelper.getStratRecord());
        List<Entry> list= entryService.getInfosBypage(entry);
        model.addAttribute("eList",list);
        List<Category> cList=categoryService.getAll();
        model.addAttribute("cList",cList);
        model.addAttribute("ph",pageHelper);
        model.addAttribute("entry",entry);
        return "/entry/list";
    }
    @RequestMapping("/add")
    public String add(Model model,Entry entry){
        model.addAttribute("entry",entry);
        return "/entry/add";
    }

    @RequestMapping("/doadd")
    public String doAdd(Entry entry){
        Date date=entry.getCreatedate();
        if(entryService.save(entry)>0){
            return "redirect:/entry/page?categoryId="+entry.getCategoryId();
        }
        return "/entry/add";
    }

    @RequestMapping("/deleteone")
    @ResponseBody
    public String deleteOne(Integer id){
        if(entryService.deleteOne(id)>0){
            return "1";
        }
        return "0";

    }

    @RequestMapping("/update")
    public String update(Model model,Integer id){
        Entry entry=entryService.getInfo(id);
        model.addAttribute("entry",entry);
        return "/entry/update";
    }


    @RequestMapping("/doupdate")
    public String update(Model model,Entry entry){
        if(entryService.update(entry)>0){
            model.addAttribute("msg","<script>alert('修改成功！');window.location='/entry/page';</script>");
            return "forward:/entry/page";
        }
        return "redirect:/entry/page";
    }










}

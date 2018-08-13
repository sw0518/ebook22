package com.ebook.util;

public class PageHelper {
    //总记录数、每页显示数量、当前页、总页数
    private int totalRecordCount;
    private int pageSize=5;
    private int currentPage;
    private int totalPageCount;
    private String sqlWhere;
    private Integer stratRecord;

    public void setStratRecord(Integer stratRecord) {
        this.stratRecord = stratRecord;
    }

    public String getSqlWhere() {
        return sqlWhere;
    }

    public void setSqlWhere(String sqlWhere) {
        this.sqlWhere = sqlWhere;
    }

    private String url="/SearchByPage";

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getTotalRecordCount() {
        return totalRecordCount;
    }

    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        if(currentPage<1){
                this.currentPage = 1;
        }else if(currentPage>this.totalPageCount){
            this.currentPage = this.totalPageCount;
        }else{
            this.currentPage = currentPage;
        }
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }
    //总页数应该是根据总数据和每页显示条数计算出来的
    public void setTotalPageCount() {
        if(this.totalRecordCount%this.pageSize==0){
            this.totalPageCount=this.totalRecordCount/this.pageSize;
        }else if(this.totalRecordCount%this.pageSize!=0){
            this.totalPageCount=this.totalRecordCount/this.pageSize+1;
        }
    }

    //构造pageHelp对象时候需要提供总记录数和当前页，默认当前页是1；
    public PageHelper(int totalRecordCount, int currentPage){
        this.totalRecordCount=totalRecordCount;
        //在构造的时候需要将总页数算好
        setTotalPageCount();
        setCurrentPage(currentPage);
    }

    //获取当前页的记录是从第几条开始的索引
    public int getStratRecord(){
        this.stratRecord=this.pageSize*(this.currentPage-1);
        if(this.stratRecord<0){
            this.stratRecord=0;
        }
        return this.stratRecord;
    }
}

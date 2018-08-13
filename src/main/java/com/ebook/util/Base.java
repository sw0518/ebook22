package com.ebook.util;

public class Base {
    private Integer pageSize=5;
    private Integer currentPage=1;
    private Integer stratRecord;

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getStratRecord() {
        return stratRecord;
    }

    public void setStratRecord(Integer stratRecord) {
        this.stratRecord = stratRecord;
    }
}

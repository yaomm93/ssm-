package com.powerlbs.vo;

import java.util.List;

/**
 * ClassName:${name}
 * package:com.powerlbs.vo
 *
 * @date:2019/10/5 16:36
 * @author:Yaoxiaoming
 **/
public class PaginationVo<T> {
    private List<T> dataList;
    private int total;

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}

package com.powerlbs.service;

import com.powerlbs.domain.Student;
import com.powerlbs.vo.PaginationVo;

import java.util.Map;

/**
 * ClassName:${name}
 * package:com.powerlbs.service
 *
 * @date:2019/10/5 16:53
 * @author:Yaoxiaoming
 **/
public interface StudentService {
    public PaginationVo<Student> pageList(Map<String,Object> map);
}

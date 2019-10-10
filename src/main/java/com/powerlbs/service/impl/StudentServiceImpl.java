package com.powerlbs.service.impl;

import com.powerlbs.dao.StudentMapper;
import com.powerlbs.domain.Student;
import com.powerlbs.service.StudentService;
import com.powerlbs.vo.PaginationVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * ClassName:${name}
 * package:com.powerlbs.service.impl
 *
 * @date:2019/10/5 16:55
 * @author:Yaoxiaoming
 **/
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public PaginationVo<Student> pageList(Map<String, Object> map) {
        int total = studentMapper.getTotalByCondition(map);
        List<Student> dataList= studentMapper.getStudentListByCondition(map);
        PaginationVo<Student> vo = new PaginationVo<Student>();
        vo.setDataList(dataList);
        vo.setTotal(total);
        return vo;
    }
}

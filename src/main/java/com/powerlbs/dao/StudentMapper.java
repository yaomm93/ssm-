package com.powerlbs.dao;

import com.powerlbs.domain.Student;

import java.util.List;
import java.util.Map;

public interface StudentMapper {

    List<Student> getStudentListByCondition(Map<String, Object> map);
    int getTotalByCondition(Map<String, Object> map);


}
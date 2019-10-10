package com.powerlbs.controllers;

import com.powerlbs.domain.Student;
import com.powerlbs.service.StudentService;
import com.powerlbs.service.impl.StudentServiceImpl;
import com.powerlbs.vo.PaginationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:${name}
 * package:com.powerlbs.controllers
 *
 * @date:2019/10/5 10:51
 * @author:Yaoxiaoming
 **/
@Controller
public class StudentController  {
    @Autowired
    private StudentService studentService;
    @RequestMapping(value="/student/pageList.do")
    @ResponseBody
    public Object pageList(String pageNo,int pageSize,String name,String gender,String address,String phone){

        System.out.println("开始条件查询和分页展示");
        int pageNoData = Integer.valueOf(pageNo);
        int pageSizeData = Integer.valueOf(pageSize);

        int skipCount = (pageNoData-1)*pageSizeData;
        Map<String,Object> map = new HashMap<>();
        System.out.println(skipCount);
        map.put("skipCount", skipCount);
        map.put("pageSize",pageSize);
        map.put("name",name);
        map.put("gender",gender);
        map.put("address", address);
        map.put("phone", phone);


        PaginationVo<Student> ss = studentService.pageList(map);

        return ss;

    }
}

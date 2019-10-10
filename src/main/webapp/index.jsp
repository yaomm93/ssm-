<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

    <link rel="stylesheet" type="text/css" href="jquery/bs_pagination/jquery.bs_pagination.min.css">
    <script type="text/javascript" src="jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="jquery/bs_pagination/en.js"></script>
    <script type="text/javascript">

        $(function(){



            //页面加载完毕后，刷新市场活动信息列表
            pageList(1,2);

            //为查询按钮，绑定事件，执行条件查询
            $("#searchBtn").click(function () {


                pageList(1,2);

            })


        });

        function pageList(pageNo,pageSize) {
            $.ajax({
                url : "student/pageList.do",
                data :{
                    "pageNo" : pageNo,
                    "pageSize" : pageSize,
                    "name" : $.trim($("#search-name").val()),
                    "gender": $.trim($("#search-gender").val()),
                    "address": $.trim($("#search-address").val()),
                    "phone": $.trim($("#search-phone").val())
                },
                type  : "get",
                dataType : "json",
                success : function(data){
                    alert(data)
                    //html = "";//定义一个全局变量

                    $.each(data.dataList,function(i,n){
                        alert(123)
                        html+='<tr class="active">';
                        html+='<td><input type="checkbox" /></td>';
                        html+='<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href=\'detail.jsp\';">'+n.name+'</a></td>';
                        html+='<td>'+n.gender+'</td>';
                        html+='<td>'+n.address+'</td>';
                        html+='<td>'+n.phone+'</td>';
                        html+='</tr>';
                    })
                    $("#studentBody").html(html)
                    var totalPages = data.total%pageSize==0?data.total/pageSize:parseInt(data.total/pageSize)+1;
                    $("#studentPage").bs_pagination({
                        currentPage: pageNo, // 页码
                        rowsPerPage: pageSize, // 每页显示的记录条数
                        maxRowsPerPage: 20, // 每页最多显示的记录条数
                        totalPages: totalPages, // 总页数
                        totalRows: data.total, // 总记录条数

                        visiblePageLinks: 3, // 显示几个卡片

                        showGoToPage: true,
                        showRowsPerPage: true,
                        showRowsInfo: true,
                        showRowsDefaultInfo: true,

                        //该回调函数的触发时机：点击分页组建的时候触发
                        onChangePage : function(event, data){
                            pageList(data.currentPage , data.rowsPerPage);
                        }
                    });
                }
            })


        }


    </script>
</head>
<body>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>学生信息列表</h3>

            <!--

                tbl_student

                id
                name
                gender
                address
                phone

            -->

        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">



        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">学生姓名</div>
                        <input class="form-control" type="text" id="search-name">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">学生性别</div>
                        <input class="form-control" type="text" id="search-gender">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">家庭地址</div>
                        <input class="form-control" type="text" id="search-address" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">联系电话</div>
                        <input class="form-control" type="text" id="search-phone">
                    </div>
                </div>

                <button type="button" id="searchBtn" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">


        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox" id="qx"/></td>
                    <td>学生姓名</td>
                    <td>学生性别</td>
                    <td>家庭地址</td>
                    <td>联系电话</td>
                </tr>
                </thead>
                <tbody id="studentBody">
                <%--<tr class="active">
                    <td><input type="checkbox" /></td>
                    <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='workbench/activity/detail.jsp';">发传单</a></td>
                    <td>zhangsan</td>
                    <td>2020-10-10</td>
                    <td>2020-10-20</td>
                </tr>
                <tr class="active">
                    <td><input type="checkbox" /></td>
                    <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">发传单</a></td>
                    <td>zhangsan</td>
                    <td>2020-10-10</td>
                    <td>2020-10-20</td>
                </tr>--%>
                </tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 30px;">

            <div id="studentPage"></div>

        </div>

    </div>

</div>
</body>
</html>
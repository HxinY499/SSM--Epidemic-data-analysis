<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/5/30
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="${APP_PATH}/static/css/index.css" rel="stylesheet">
</head>
<body>
<%--标题--%>
<div class="topTitle w">
    <div class = "ssm-crud">SSM-CRUD</div>
    <div class = "user">
        【${user.userName}】
        <a class = "logout" href="logout">退出</a>
    </div>
</div>

<%--顶部按钮--%>
<div class="topBtn w clearfix">
    <div class="search-box">
        <input class="search-txt" type="text" placeholder="请输入用户名" id="search-info"/>
        <button type="button" class="search-btn button" id="search-btn">
            <i class="glyphicon glyphicon-search"></i>
        </button>
    </div>
    <div class="btnDiv clearfix">
        <button type="button" class="topAdd button" id="top_emp_add">新增</button>
        <button type="button" class="topDel button" id="top_emp_del">删除</button>
    </div>
</div>

<%--表格内容部分--%>
<div>
    <table class="w empTable" id="emps_table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="check_all"/>
            </th>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>邮箱</th>
            <th>部门</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<%--分页部分--%>
<div class="w page">
    <div class="pageLeft" id="page_left_area">

    </div>

    <div id="page_right_area">

    </div>
</div>

<!-- 新增员工topAdd模态框 -->
<div class="modal fade" id="top_emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="input_addEmp_empName" placeholder="姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="input_addEmp_email" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="input_addEmp_gender1" value="man" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="input_addEmp_gender2" value="woman"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="dId" id="input_addEmp_dept">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" id="save_addEmp"
                        style="background-color: #1ce37c;border-color: #35ae5a;">
                    保存
                </button>
            </div>
        </div>
    </div>
</div>

<%--员工修改tableEdit模态框--%>
<div class="modal fade" id="table_emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="input_updateEmp_email" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="input_updateEmp_gender1" value="man" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="input_updateEmp_gender2" value="woman"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="dId" id="input_updateEmp_dept">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-success" id="save_updateEmp"
                        style="background-color: #1ce37c;border-color: #35ae5a;">
                    保存
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    var totalRecord,currentPage;
    /*默认第一页*/
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $("#check_all").prop("checked",false);
        $.ajax({
            url: "${APP_PATH}/emp",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                build_emps_table(result);
                build_page_left(result);
                build_page_right(result)
            }
        });
    }

    /*显示员工表*/
    function build_emps_table(result) {

        $("#emps_table tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == 'woman'?'女':'男');
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("tableEdit button").append("编辑");
            editBtn.attr("edit_id", item.empId);

            var delBtn = $("<button></button>").addClass("tableDel button").append("删除");
            delBtn.attr("del_id", item.empId);

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    /*分页信息*/
    function build_page_left(result) {

        $("#page_left_area").empty();

        $("#page_left_area").append("当前第 "
            + result.extend.pageInfo.pageNum
            + " 页，总 "
            + result.extend.pageInfo.pages
            + " 页，总 "
            + result.extend.pageInfo.total
            + " 条记录")
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    /*分页条*/
    function build_page_right(result) {

        $("#page_right_area").empty();

        var ul = $("<ul></ul>").addClass("pageRight");

        var firstPageLi = $("<li></li>")
            .append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").addClass("prev")
            .append($("<a></a>").append("&laquo;").attr("href", "#"));
        if (!result.extend.pageInfo.hasPreviousPage) {
            firstPageLi.addClass("pageDisabled");
            prePageLi.addClass("pageDisabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").addClass("next")
            .append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>")
            .append($("<a></a>").append("尾页").attr("href", "#"));
        if (!result.extend.pageInfo.hasNextPage) {
            lastPageLi.addClass("pageDisabled");
            nextPageLi.addClass("pageDisabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("pageActive");
            }
            numLi.click(function () {
                to_page(item)
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);
        $("#page_right_area").append(ul);
    }

    /*顶部新增按钮弹出模态框*/
    $("#top_emp_add").click(function () {

        resert_form("#top_emp_add_modal form");
        getDepts("#input_addEmp_dept");
        $("#top_emp_add_modal").modal({
            backdrop:"static"
        });
    });

    /*表格编辑按钮弹出模态框*/
    $(document).on("click",".tableEdit",function () {

        resert_form("#table_emp_update_modal form");
        getDepts("#input_updateEmp_dept");
        getEmp($(this).attr("edit_id"));

        $("#save_updateEmp").attr("edit_id",$(this).attr("edit_id"));
        $("#table_emp_update_modal").modal({
            backdrop:"static"
        });
    });

    /*表单重置*/
    function resert_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    /*获取部门信息*/
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/dept",
            type: "GET",
            async:false,
            success:function (result) {
                $.each(result.extend.dept, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });

            }
        });
    }

    /*获取员工信息*/
    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#input_updateEmp_email").val(empData.email);
                $("#table_emp_update_modal input[name=gender]").val([empData.gender]);
                $("#input_updateEmp_dept").val([empData.dId]);
            }
        });
    }

    /*校验提示信息*/
    function show_validate_msg(ele, status, msg) {

        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");

        if ("success" == status) {
            $(ele).parent().addClass("has-success");
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
        }
        $(ele).next("span").text(msg);
    }

    /*添加员工empName数据校验*/
    $("#input_addEmp_empName").blur(function(){
        validate_addEmp_empName();
    } );
    function validate_addEmp_empName() {
        var empName = $("#input_addEmp_empName").val();
        var regName = /(^[A-Za-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            show_validate_msg("#input_addEmp_empName", "error",
                "名字必须是2-5个中文或者5-16位英文数字组合");
            return false;
        } else {
            show_validate_msg("#input_addEmp_empName", "success", "");
        }
    }

    /*添加员工email数据校验*/
    $("#input_addEmp_email").blur(function () {
        validate_addEmp_email();
    });
    function validate_addEmp_email() {
        var email = $("#input_addEmp_email").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#input_addEmp_email", "error", "邮箱格式输入错误");
            $("#save_addEmp").attr("ajax-va", "error");
        } else {
            $.ajax({
                url: "${APP_PATH}/checkemail",
                type: "POST",
                data: "email=" + email,
                success: function (result) {
                    if (result.code == 100) {
                        show_validate_msg("#input_addEmp_email", "success", "");
                        $("#save_addEmp").attr("ajax-va", "success");
                    } else {
                        show_validate_msg("#input_addEmp_email", "error", result.extend.va_msg);
                        $("#save_addEmp").attr("ajax-va", "error");
                    }
                }
            });
        }
    }

    /*新增员工模态框保存按钮*/
    $("#save_addEmp").click(function () {

        if(validate_addEmp_empName() == false||$(this).attr("ajax-va") == "error"){
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data: $("#top_emp_add_modal form").serialize(),
            success:function (result) {
                if (result.code == 100) {
                    alert(result.msg);
                    $("#top_emp_add_modal").modal('hide');
                    to_page(totalRecord);
                } else {
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#input_addEmp_email", "error", result.extend.errorFields.email);
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#input_addEmp_empName", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });

    /*员工编辑email校验*/
    $("#input_updateEmp_email").blur(function () {
        var email = $("#input_updateEmp_email").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#input_updateEmp_email", "error", "邮箱格式输入错误");
            $("#save_updateEmp").attr("ajax-va", "error");
        } else {
            show_validate_msg("#input_updateEmp_email", "success", "");
            $.ajax({
                url: "${APP_PATH}/checkemail",
                type: "POST",
                data: "email=" + email,
                success: function (result) {
                    if (result.code == 100) {
                        show_validate_msg("#input_updateEmp_email", "success", "");
                        $("#save_updateEmp").attr("ajax-va", "success");
                    } else {
                        show_validate_msg("#input_updateEmp_email", "error", result.extend.va_msg);
                        $("#save_updateEmp").attr("ajax-va", "error");
                    }
                }
            });
        }
    });

    /*表格单个删除按钮*/
    $(document).on("click",".tableDel",function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确认删除【"+empName+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/emp/" + $(this).attr("del_id"),
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });

    /*全选*/
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    /*全选*/
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    /*顶部全部删除按钮*/
    $("#top_emp_del").click(function () {
        var empNames = "";
        var del_id = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_id += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        del_id = del_id.substring(0,del_id.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/emp/" + del_id,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });

    /*员工编辑模态框保存按钮*/
    $("#save_updateEmp").click(function () {

        if($(this).attr("ajax-va") == "error"){
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit_id"),
            type: "PUT",
            data: $("#table_emp_update_modal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    alert(result.msg);
                    $("#table_emp_update_modal").modal('hide');
                    to_page(currentPage);
                } else {
                    if (undefined != result.        extend.errorFields.email) {
                        show_validate_msg("#input_updateEmp_email", "error", result.extend.errorFields.email);
                    }
                }
            }
        });
    });

    /*搜索框*/
    $("#search-btn").click(function(){
        var empName = $("#search-info").val();
        $.ajax({
            url:"${APP_PATH}/search",
            type:"POST",
            data:"empName="  + empName,
            success:function (result) {
                var emps = result.extend.emps;
                var emp;
                $.each(emps, function (index, item){
                    var empId = item.empId;
                    var empName = item.empName;
                    var gender = item.gender == 'woman'?'女':'男';
                    var email = item.email;
                    var deptName = item.department.deptName;
                    if(emp!=null){
                        emp = emp+"编号: "+empId+" 姓名: "+empName+" 性别: "+gender+" 邮箱: "+email+" 部门: "+deptName+"\n";
                    }else{
                        emp = "编号: "+empId+" 姓名: "+empName+" 性别: "+gender+" 邮箱: "+email+" 部门: "+deptName+"\n";
                    }
                });
                if(emp != null){
                    alert(emp);
                }else{
                    alert("未找到");
                }
                $("#search-info").val("");
            }
        })
    });
</script>

</body>
</html>

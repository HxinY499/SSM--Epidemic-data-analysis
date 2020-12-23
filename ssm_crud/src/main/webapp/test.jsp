<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/8/15
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</html>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script type="text/javascript" src="./static/echarts.js"></script>
</head>

<body>
<div id="main" style="width: 1000px;height:800px;"></div>
<script type="text/javascript">
    let myChart = echarts.init(document.getElementById('main'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title: {
            text: 'XXXXX'
        },

        tooltip: {},
        legend: {
            data:['XXX']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: 'XXX',
            type: 'bar',
            data: []
        }]
    });
    myChart.showLoading();
    let names=[];    //X
    let nums=[];    //Y
    $.ajax({
        type : "POST",
        url : "aaa",
        dataType : "json",
        success : function(result) {
            console.log(result)
            if (result) {
                names = result.x;
                nums = result.y;
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        // 根据名字对应到相应的系列
                        name: 'XXX',
                        data: nums
                    }]
                });

            }
            console.log(result)
        },
        error : function(errorMsg) {
            alert("图表请求数据失败!");
            myChart.hideLoading();
        }
    })
</script>
</body>
</html>
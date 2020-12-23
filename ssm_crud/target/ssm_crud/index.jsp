<%--
Created by IntelliJ IDEA.
User: lenovo
Date: 2020/8/15
Time: 13:29
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</html>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新冠疫情数据分析</title>
    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <script type="text/javascript" src="./static/echarts.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="./static/index.css">
</head>

<body>
<div class="top"></div>
<div class="header">
    <div class="header-info">新冠疫情数据分析<span> 积极防护，保护自己，戴口罩，勤洗手</span></div>
</div>
<div class="center">
    <div class="title1">
        <h2>数据展示</h2>
    </div>
    <ul class='show1'>
        <li id='first'></li>
        <li id='second'></li>
        <li>
            <div id='third'></div>
            <i id='btn1' class="fa fa-sort-asc"></i>
            <i id='btn2' class="fa fa-sort-desc"></i>
        </li>
    </ul>
    <div class="title2">
        <h2>数据分析</h2>
    </div>
    <ul class='show2'>
        <li id='analyse-first'></li>
        <li id='analyse-second'></li>
    </ul>
</div>
<div class="footer">
    <div>吴锦鹏&nbsp;&nbsp;何欣宇&nbsp;&nbsp;张俊俊</div>
</div>
<script type="text/javascript">
    let myChartBar = echarts.init(document.getElementById('first'))
    let myChartPie = echarts.init(document.getElementById('second'))
    let myChartCountry = echarts.init(document.getElementById('third'))
    let myChartAna1 = echarts.init(document.getElementById('analyse-first'))
    let myChartAna2 = echarts.init(document.getElementById('analyse-second'))
    var $btn1 = $("#btn1")
    var $btn2 = $("#btn2")

    let index = 0
    let optionBar = {
        backgroundColor: 'white',
        title: {
            text: '中国单日新增确诊病例数TOP20（截至8月11日）',
            left: 'center',
            top: 20,
            textStyle: {
                color: 'black'
            }
        },
        tooltip: {},
        xAxis: {
            type: 'category',
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '新增确诊数',
            type: 'bar',
            showBackground: true,
            backgroundStyle: {
                color: 'rgba(220, 220, 220, 0.8)'
            },
            data: []
        }]
    }
    let optionPie = {
        backgroundColor: 'white',
        title: {
            text: '中国单月内平均每日新增确诊病例数（截至8月11日）',
            left: 'center',
            top: 20,
            textStyle: {
                color: 'black'
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            top:20,
            left: 15,
            data: []
        },
        series: [{
            name: '具体数据',
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                show: false,
                position: 'center'
            },
            emphasis: {
                label: {
                    show: true,
                    fontSize: '30',
                    fontWeight: 'bold'
                }
            },
            labelLine: {
                show: false
            },
            data: []
        }]
    }
    let optionCountry = {
        title: {
            text: '世界单日新增确诊病例数最多的国家（截至8月11日）',
            left: 'center',
            top: 20,
            textStyle: {
                color: 'black'
            }
        },
        xAxis: {
            data: [],
            axisLabel: {
                inside: true,
                textStyle: {
                    color: 'black'
                },
            },

            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            z: 10
        },
        yAxis: {
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: '#999'
                }
            }
        },
        dataZoom: [{
            type: 'inside'
        }],
        series: [{
            type: 'bar',
            itemStyle: {
                color: new echarts.graphic.LinearGradient(
                    0, 0, 0, 1, [{
                        offset: 0,
                        color: '#83bff6'
                    }, {
                        offset: 0.5,
                        color: '#188df0'
                    }, {
                        offset: 1,
                        color: '#188df0'
                    }]
                )
            },
            emphasis: {
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1, [{
                            offset: 0,
                            color: '#2378f7'
                        }, {
                            offset: 0.7,
                            color: '#2378f7'
                        }, {
                            offset: 1,
                            color: '#83bff6'
                        }]
                    )
                }
            },
            data: []
        }]
    }
    let optionAna1 = {
        title: {
            text: '中国新增确诊病例平均月增长率（截至8月11日）',
            left: 'center',
            top: 20,
            textStyle: {
                color: 'black'
            }
        },
        xAxis: {
            type: 'category',
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [],
            type: 'line'
        }]
    }
    myChartBar.setOption(optionBar);
    myChartBar.showLoading();
    myChartPie.setOption(optionPie);
    myChartPie.showLoading();
    myChartCountry.setOption(optionCountry);
    myChartCountry.showLoading();
    myChartAna1.setOption(optionAna1);
    myChartAna1.showLoading();
    myChartAna2.setOption(optionCountry);
    myChartAna2.showLoading();

    $.ajax({
        type: "POST",
        url: "aaa",
        dataType: "json",
        success: function(result) {
            let names = [];
            let nums = [];
            console.log(result.x + "===" + result.y)
            if (result) {
                if (result.x.length > 20) {
                    index = 20;
                } else {
                    index = result.x.length
                }
                console.log(index)
                for (let i = 0; i < index; i++) {
                    names[i] = result.x[i]
                    nums[i] = result.y[i]
                }
                myChartBar.hideLoading();
                myChartBar.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '新增确诊数',
                        data: nums
                    }]
                });
            }
            console.log(result)
        },
        error: function(errorMsg) {
            alert("展示图表1请求数据失败!");
            myChartBar.hideLoading();
        }
    })
    $.ajax({
        type: "POST",
        url: "bbb",
        dataType: "json",
        success: function(result) {
            var analyseNums = []
            var analyseNames = []
            var names = []
            var nums = []
            var arr = []
            console.log(result.x + "===" + result.y)
            if (result) {
                if (result.x.length > 20) {
                    index = 20;
                } else {
                    index = result.x.length
                }
                console.log(index)
                for (let i = 0; i < index; i++) {
                    names[i] = result.x[i]
                    nums[i] = result.y[i]
                }
                console.log(names)
                console.log(nums)
                for (let i = 0; i < index; i++) {
                    arr[i] = {
                        value: nums[i],
                        name: names[i]
                    }
                }
                for(let i = 0; i < index; i++){
                    if((i+2) <= index){
                        analyseNums[i] = ((nums[i+1] - nums[i])/ nums[i]) - 1
                        analyseNames[i] = (i+1) + "-" + (i+2)
                    }
                }
                console.log(analyseNames + "~~~~" + analyseNums)
                myChartPie.hideLoading();
                myChartPie.setOption({
                    legend: {
                        data: names
                    },
                    series: [{
                        data: arr
                    }]
                });
                console.log("*************************************************")
                myChartAna1.hideLoading();
                myChartAna1.setOption({
                    xAxis: {
                        type: 'category',
                        data: analyseNames
                    },
                    series: [{
                        data: analyseNums,
                        type: 'line'
                    }]
                })
            }
            console.log(result)
        },
        error: function(errorMsg) {
            alert("展示图表2请求数据失败!");
            myChartBar.hideLoading();
        }
    })
    $.ajax({
        type: "POST",
        url: "ccc",
        dataType: "json",
        success: function(result) {
            if (result) {
                var dataAxis = []
                var data = result.y
                var dataX = []
                var dataY = []
                var index = 0
                let res = {}
                let maxName = []
                let maxNum = []
                for (var i = 0; i < result.x1.length; i++) {
                    dataAxis[i] = result.x1[i] + " " + result.x2[i]
                }
                if (dataAxis.length > 20) {
                    var max = Number.isInteger(dataAxis.length / 20) ? (dataAxis.length / 20) : (parseInt((dataAxis.length / 20) + 1))
                    let index = 0
                    for (var i = 0; i < max; i++) {
                        dataX[i] = []
                        dataY[i] = []
                        for (var j = 0; j < 20; j++) {
                            dataX[i][j] = dataAxis[index]
                            dataY[i][j] = data[index]
                            index++
                        }
                    }
                }
                result.x2.forEach((item) => {
                    res[item] ? res[item] += 1 : res[item] = 1
                })
                for(let i = 0; i < 10; i++){
                    maxNum[i] = 0
                    for (let r in res) {
                        if (res[r] > maxNum[i]) {
                            maxName[i] = r
                            maxNum[i] = res[r]
                        }
                    }
                    delete res[maxName[i]]
                }
                let option = {
                    xAxis: {
                        data: dataX[0].map(function(str) {
                            return str.replace(" ", "\n")
                        })
                    },
                    series: [{
                        data: dataY[0]
                    }]
                }
                myChartCountry.hideLoading()
                myChartCountry.setOption(option)
                myChartAna2.hideLoading()
                myChartAna2.setOption({
                    title: {
                        text: '世界单日新增确诊病例数最多的国家TOP10（截至8月11日）',
                    },
                    xAxis: {
                        data: maxName
                    },
                    series: [{
                        data: maxNum
                    }]
                })
                $btn1.click(function() {

                    if (index != 0) {
                        console.log("prev")
                        index--
                        let option = {
                            xAxis: {
                                data: dataX[index].map(function(str) {
                                    return str.replace(" ", "\n")
                                })
                            },
                            series: [{
                                data: dataY[index]
                            }]
                        }
                        myChartCountry.setOption(option);
                    }

                })
                $btn2.click(function() {
                    if (index < dataX.length - 1) {
                        console.log("next")
                        index++
                        console.log(index)
                        console.log(dataX[index])
                        let option = {
                            xAxis: {
                                data: dataX[index].map(function(str) {
                                    return str.replace(" ", "\n")
                                })
                            },
                            series: [{
                                data: dataY[index]
                            }]
                        }
                        myChartCountry.setOption(option);
                    }

                })
            }
            var zoomSize = 6;
            myChartCountry.on('click', function(params) {
                console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
                myChartCountry.dispatchAction({
                    type: 'dataZoom',
                    startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
                    endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
                });
            })
            myChartAna2.on('click', function(params) {
                console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
                myChartCountry.dispatchAction({
                    type: 'dataZoom',
                    startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
                    endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
                });
            })
        },
        error: function(errorMsg) {
            alert("展示图表3请求数据失败!");
            myChartBar.hideLoading();
        }
    })
</script>
</body>

</html>
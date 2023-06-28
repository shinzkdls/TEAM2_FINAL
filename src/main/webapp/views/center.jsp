<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 차트 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/cylinder.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="/js/charts.js"></script>
<script>
    function openLinkInNewWindow(url) {
        window.open(url, '_blank');
    }
</script>
<script>
    let center_chart1 = {
        //init에서는 서버에다가 데이터를 요청할것
        init: function () {
            $.ajax({
                url: '/chart1',
                success: function (data) {
                    center_chart1.display(data);
                }
            });
        },
        //display는 데이터를 받아서 차트를 뿌려주기
        display: function (data) {
            Highcharts.chart('container1', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '성별에 따른 레시피 좋아요 수'
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: [
                        '한식',
                        '중식',
                        '일식',
                        '양식',
                        '디저트',
                        '동남아식'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: ''
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: data
            });
        }
    };

    let center_chart2 = {
        init: function () {
            $.ajax({
                url: '/chart2',
                success: function (data) {
                    center_chart2.display(data);
                }
            })
        },
        display: function (data) {
            Highcharts.chart('container2', {
                chart: {
                    type: 'variablepie'
                },
                title: {
                    text: '유형별 레시피 개수',
                    align: 'left'
                },
                tooltip: {
                    headerFormat: '',
                    pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
                        '개수: <b>{point.y}</b><br/>' +
                        '<b></b><br/>'
                },
                series: [{
                    minPointSize: 15,
                    innerSize: '50%',
                    zMin: 0,
                    name: 'countries',
                    borderRadius: 5,
                    data: data,
                    colors: [
                        '#ff0000',
                        '#FF7C00',
                        '#fff200',
                        '#1feeaf',
                        '#170ff3',
                        '#9c23e2',
                    ]
                }]
            });
        }
    };

    let center_chart3 = {
        init: function () {
            $.ajax({
                url: '/chart3',
                success: function (data) {
                    center_chart3.display(data);
                }
            })
        },
        display: function (data) {
            Highcharts.chart('container3', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: '클래스 유형별 총 결제액',
                    align: 'left'
                },
                subtitle: {
                    text: '',
                    align: 'left'
                },
                xAxis: {
                    categories: ['한식', '중식', '일식', '양식', '디저트', '동남아식'],
                    title: {
                        text: null
                    },
                    gridLineWidth: 1,
                    lineWidth: 0
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '결제금액(원)',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    },
                    gridLineWidth: 0
                },
                tooltip: {
                    valueSuffix: ''
                },
                plotOptions: {
                    bar: {
                        borderRadius: '50%',
                        dataLabels: {
                            enabled: true
                        },
                        groupPadding: 0.1
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -40,
                    y: 80,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor:
                        Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
                    shadow: true
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '원',
                    data: data
                }]
            });
        }
    };

    let dashboard = {
        init: function () {
            $.ajax({
                url: '/dashboard',
                success: function (response) {
                    $('#custcount').text(response.custcount);
                    $('#recipecount').text(response.recipecount);
                    $('#classcount').text(response.classcount);
                    $('#earnings').text(dashboard.formatCurrency(response.earnings));
                }
            })
        },

        formatCurrency: function (value) {
            // 숫자를 3자리마다 쉼표(,)로 구분하여 포맷팅합니다.
            var formattedValue = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            // 앞에 통화 기호를 추가합니다. 예를 들어, '￦'을 사용하려면 '￦'을 추가하면 됩니다.
            formattedValue = '￦' + formattedValue;
            return formattedValue;
        }
    };

    $(function () {
        center_chart1.init();
        center_chart2.init();
        center_chart3.init();
        dashboard.init();

        setInterval(center_chart1.init, 2000);
        setInterval(center_chart2.init, 2000);
        setInterval(center_chart3.init, 2000);
        setInterval(dashboard.init, 2000);
    });
</script>
<%----------------------------------------------------------------------------------------------------------------%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                The Number of Users
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="custcount">0</div>
                        </div>
                        <div class="col-auto">
                            <i class="fa fa-user"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                The Number of Recipes
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="recipecount">0</div>
                        </div>
                        <div class="col-auto">
                            <i class="fa fa-utensils"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">The Number of Cooking
                                Classes
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="classcount">0</div>
                                </div>
                                <%--                                <div class="col">--%>
                                <%--                                    <div class="progress progress-sm mr-2">--%>
                                <%--                                        <div class="progress-bar bg-info" role="progressbar"--%>
                                <%--                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"--%>
                                <%--                                             aria-valuemax="100"></div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fa fa-cookie-bite"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                EARNINGS (MONTHLY)
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="earnings"><fmt:formatNumber
                                    value="" type="currency"
                                    currencyCode="KRW" pattern="###,###원"/>0
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fa fa-won-sign"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Body -->
                <div class="card-body" style="height: 503px">
                    <div id="container1">
                    </div>
                </div>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Body -->
                <div class="card-body">
                    <div id="container2"></div>
                    <div class="mt-4 text-center small">
                                          <span class="mr-2">
                                              <i class="fas fa-circle" style="color: #ff0000"></i> 한식
                                          </span>
                        <span class="mr-2">
                                              <i class="fas fa-circle" style="color: #FF7C00"></i> 양식
                                          </span>
                        <span class="mr-2">
                                              <i class="fas fa-circle" style="color: #fff200"></i> 중식
                                          </span><br/>
                        <span class="mr-2">
                                              <i class="fas fa-circle" style="color: #1feeaf"></i> 일식
                                          </span>
                        <span class="mr-2">
                                              <i class="fas fa-circle" style="color: #170ff3"></i> 동남아식
                                          </span>
                        <span class="mr-2">
                                              <i class="fas fa-circle" style="color: #9c23e2"></i> 디저트
                                          </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <figure class="highcharts-figure">
                        <div id="container3"></div>
                    </figure>
                </div>
            </div>

            <!-- Color System -->
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card bg-primary text-white shadow">
                        <div class="card-body"
                             onclick="openLinkInNewWindow('http://127.0.0.1/recipe/all?type=&ingredients1=&recipelevel=&recipetitle=&sort=0')"
                             style="cursor:pointer;">
                            레시피 서비스 바로가기
                            <div class="text-white-50 small" style="color: white">Recipe Service</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-success text-white shadow">
                        <div class="card-body"
                             onclick="openLinkInNewWindow('http://127.0.0.1/cookingclass/class?location=&type=&classtitle=&sort=1')"
                             style="cursor:pointer;">
                            클래스 서비스 바로가기
                            <div class="text-white-50 small">Class Service</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-info text-white shadow">
                        <div class="card-body">
                            Info
                            <div class="text-white-50 small">#36b9cc</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-warning text-white shadow">
                        <div class="card-body">
                            Warning
                            <div class="text-white-50 small">#f6c23e</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-danger text-white shadow">
                        <div class="card-body">
                            Danger
                            <div class="text-white-50 small">#e74a3b</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-secondary text-white shadow">
                        <div class="card-body">
                            Secondary
                            <div class="text-white-50 small">#858796</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-light text-black shadow">
                        <div class="card-body">
                            Light
                            <div class="text-black-50 small">#f8f9fc</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-dark text-white shadow">
                        <div class="card-body">
                            Dark
                            <div class="text-white-50 small">#5a5c69</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-6 mb-4">

            <!-- Illustrations -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">새로 등록된 레시피</h6>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <a target="_blank" rel="nofollow"
                           href="http://127.0.0.1:80/recipe/detail?recipepin=${recipedetail.recipepin}">
                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                 src="/uimg/${recipedetail.thumbnailimg}" alt="...">
                        </a>
                    </div>
                    <p>${recipedetail.recipedesc}</p>
                    <a target="_blank" rel="nofollow"
                       href="http://127.0.0.1:80/recipe/detail?recipepin=${recipedetail.recipepin}">${recipedetail.recipetitle}</a>
                </div>
            </div>

            <!-- Illustrations -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">새로 등록된 클래스</h6>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <a target="_blank" rel="nofollow"
                           href="http://127.0.0.1:80/cookingclass/detail?classpin=${classdetail.classpin}">
                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                 src="/uimg/${classdetail.thumbnailimg}" alt="...">
                        </a>
                    </div>
                    <p>${classdetail.classdesc}</p>
                    <a target="_blank" rel="nofollow"
                       href="http://127.0.0.1:80/cookingclass/detail?classpin=${classdetail.classpin}">${classdetail.classtitle}</a>
                </div>
            </div>

        </div>
    </div>

</div>
<!-- /.container-fluid -->


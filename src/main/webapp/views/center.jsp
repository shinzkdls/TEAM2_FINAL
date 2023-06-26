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

  let center_chart1 ={
    //init에서는 서버에다가 데이터를 요청할것
    init:function(){
      $.ajax({
        url:'/chart1',
        success:function(data){
          center_chart1.display(data);
        }
      });
    },
    //display는 데이터를 받아서 차트를 뿌려주기
    display:function(data){
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

  let center_chart2 ={
    init:function(){
      $.ajax({
        url:'/chart2',
        success:function(data){
          center_chart2.display(data);
        }
      })
    },
    display:function(data){
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

  $(function(){
    center_chart1.init();
    center_chart2.init();

    setInterval(center_chart1.init,5000);
    setInterval(center_chart2.init,5000);
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
                      Earnings (Monthly)</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800" id="uppercontainer1">$40,000</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
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
                      Earnings (Annual)</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
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
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                    </div>
                    <div class="row no-gutters align-items-center">
                      <div class="col-auto">
                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                      </div>
                      <div class="col">
                        <div class="progress progress-sm mr-2">
                          <div class="progress-bar bg-info" role="progressbar"
                               style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                               aria-valuemax="100"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
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
                      Pending Requests</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-comments fa-2x text-gray-300"></i>
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
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
              </div>
              <div class="card-body">
                <h4 class="small font-weight-bold">Server Migration <span
                        class="float-right">20%</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                       aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Sales Tracking <span
                        class="float-right">40%</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                       aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Customer Database <span
                        class="float-right">60%</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar" role="progressbar" style="width: 60%"
                       aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Payout Details <span
                        class="float-right">80%</span></h4>
                <div class="progress mb-4">
                  <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                       aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h4 class="small font-weight-bold">Account Setup <span
                        class="float-right">Complete!</span></h4>
                <div class="progress">
                  <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                       aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>
            </div>

            <!-- Color System -->
            <div class="row">
              <div class="col-lg-6 mb-4">
                <div class="card bg-primary text-white shadow">
                  <div class="card-body">
                    Primary
                    <div class="text-white-50 small">#4e73df</div>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 mb-4">
                <div class="card bg-success text-white shadow">
                  <div class="card-body">
                    Success
                    <div class="text-white-50 small">#1cc88a</div>
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
                <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
              </div>
              <div class="card-body">
                <div class="text-center">
                  <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                       src="img/undraw_posting_photo.svg" alt="...">
                </div>
                <p>Add some quality, svg illustrations to your project courtesy of <a
                        target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                  constantly updated collection of beautiful svg images that you can use
                  completely free and without attribution!</p>
                <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                  unDraw &rarr;</a>
              </div>
            </div>

            <!-- Approach -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
              </div>
              <div class="card-body">
                <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                  CSS bloat and poor page performance. Custom CSS classes are used to create
                  custom components and custom utility classes.</p>
                <p class="mb-0">Before working with this theme, you should become familiar with the
                  Bootstrap framework, especially the utility classes.</p>
              </div>
            </div>

          </div>
        </div>

      </div>
      <!-- /.container-fluid -->


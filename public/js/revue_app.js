(function(){
  var app = angular.module('revue', []);
  app.controller('LogsController', function($scope, $http){
    $scope.logs = [];

    $http.get('/logs')

    .success(function(data) {
      $scope.logs = data;
    })

    .error(function(data) {
      console.log("Error when getting the json at /logs");
    });
  });
  app.controller('MostActiveController', function($scope, $http){
    $scope.most_active = [];

    $http.get('/most_active')

    .success(function(data) {
      $scope.most_active = data;
    })

    .error(function(data) {
      console.log("Error when getting the json at /most_active");
    });

  });



  app.controller('MostActiveController', function($scope, $http){

    var chart_width = 500;
    var chart_height = 250;
    $scope.most_active = [];

    $http.get('/most_active')
    .success(function(data) {
      console.log("from sucess : " + data[0].value);
      $scope.most_active = data;
      $scope.updateChart();
    });

    $scope.updateChart = function() {
      var index = 0;
      var data = angular.fromJson($scope.most_active);
      var bar_width = 500 / (data.length); 

      d3.selectAll('.chart').selectAll('div').remove();

      d3.select(".chart")
          .selectAll("div")
          .data(data)
          .enter().append("div")
          .style("width", function(d) { return bar_width + "px"; })
          .style("height", function(d) { return d.value + "%"; })
          .style("right", function(d) { return (index++) * (bar_width + 2) + "px"; });
    }

    $scope.updateChart();
  });

})();



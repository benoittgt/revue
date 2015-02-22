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
  var chart_width = 500;
  var chart_height = 250;


  app.controller('mainController', ["$scope", function($scope){
    $scope.chart_data = "40, 80, 15, 60, 23, 95";

    $scope.updateChart = function() {
      var index = 0;
      var data = angular.fromJson("[" + $scope.chart_data + "]");
      var bar_width = 500 / (data.length); 

      /* Clear out the existing elements. */
      d3.selectAll('.chart').selectAll('div').remove();

      d3.select(".chart")
          .selectAll("div")
          .data(data)
          .enter().append("div")
          .style("width", function(d) { return bar_width + "px"; })
          .style("height", function(d) { return d + "%"; })
          .style("left", function(d) { return (index++) * (bar_width + 2) + "px"; }); /* +2 as we have a 1px margin*/
    }

    /* Show the chart on load. */
    $scope.updateChart();
  }]);

})();



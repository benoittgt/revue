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

})();

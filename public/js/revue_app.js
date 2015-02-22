(function(){
  var app = angular.module('revue', []);
  app.controller('LogsController', function($scope, $http){
    $scope.logs = [];
    $http.get('/logs').
    success(function(data) {
      $scope.logs = data;
    }).
  error(function(data) {
    console.log("Error when getting the json at /logs");
  });
  });
})();

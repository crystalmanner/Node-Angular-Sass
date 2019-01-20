@app.controller 'EnrollmentCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'parentFactory', 'AuthenticationFactory',
  ($scope, $http, $window, $location, $timeout, parentFactory, AuthenticationFactory) ->
        $scope.pageInit = () ->
          console.log("Billing Section init")

        $scope.set_discount = () ->
            console.log("this is set discount")

        angular.element(document).ready( () ->
          $scope.pageInit()
        )


]
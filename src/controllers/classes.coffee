@app.controller 'ClassesCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'parentFactory', 'AuthenticationFactory',
  ($scope, $http, $window, $location, $timeout, parentFactory, AuthenticationFactory) ->

      baseurl = 'http://localhost:12008/v1/staff';
      $scope.staffInfo = {}
      $scope.staffNote = {}
      $scope.stNoteList = {}
      $scope.errpInfo = {}
      $scope.errpInfo.hasError = false;

      $scope.edit_staff_info = () ->
          console.log('start edit Staff signup..')
          console.log($scope.staffInfo)
          $http.post baseurl + '/info/create', {
              name: $scope.staffInfo.name,
              dob: $scope.staffInfo.dob,
              addy1: $scope.staffInfo.addy1,
              addy2: $scope.staffInfo.addy2,
              city: $scope.staffInfo.city,
              state: $scope.staffInfo.state,
              zip: $scope.staffInfo.zip,
              phone: $scope.staffInfo.phone,
              email_address: $scope.staffInfo.email_address,
              twitter: $scope.staffInfo.twitter,
              facebook: $scope.staffInfo.facebook,
              emergency_name: $scope.staffInfo.emergency_name,
              emergency_phone: $scope.staffInfo.emergency_phone,
              other_info: $scope.staffInfo.other_info
          }
          .success (data) ->
              $scope.initStaff()
              $scope.errpInfo.hasError = true
              $scope.errpInfo.message = "Saved Successfully!"
              $scope.errpInfo.type = "success"
          .error (status) ->
              console.log(status);
              $scope.errpInfo.hasError = true
              $scope.errpInfo.message = "Failed!"
              $scope.errpInfo.type = "warning"

      $scope.add_staff_note = () ->
          console.log("staff note")
          console.log($scope.staffNote)
          $http.post baseurl + '/note/create', {
              date: $scope.staffNote.date,
              note: $scope.staffNote.note,
              flag: 3
          }
          .success (data) ->
              $scope.init_staffNote()
              $scope.errpInfo.hasError = true
              $scope.errpInfo.message = "Saved Successfully!"
              $scope.errpInfo.type = "success"
          .error (status) ->
              console.log(status);
              $scope.errpInfo.hasError = true
              $scope.errpInfo.message = "Failed!"
              $scope.errpInfo.type = "warning"

      $scope.pageInit = () ->
          $scope.initStaff()
          $scope.init_staffNote()

      $scope.initStaff = () ->
          console.log("this is init staff")
          $http.post baseurl + '/info/init', {  }
          .success (data) ->
              $scope.staffInfo = data.data;
              console.log($scope.staffInfo)
          .error (status) ->
              console.log("page init error")

      $scope.init_staffNote = () ->
          console.log("parent note init")
          $http.post baseurl + '/note/init', {  }
          .success (data) ->
              $scope.stNoteList = data.data;
              console.log("parent note info")
              console.log($scope.stNoteList)
              $timeout(() ->
                $scope.$apply();
              );
          .error (status) ->
            console.log("page init error")

      angular.element(document).ready( () ->
        $scope.pageInit()
      )
]
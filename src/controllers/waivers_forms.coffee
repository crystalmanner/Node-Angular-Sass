###@app.directive('jqdatepicker', ->
    restrict: 'A',
    require: 'ngModel',
    link: (scope, element, attrs, CalendarCtrl, ngModelCtrl) ->
        updateModel = (dateText) ->
            scope.$apply( () ->
                ngModelCtrl.$setViewValue(dateText)
        )
        element.datepicker({
            dateFormat: 'mm-dd-yy',
            onSelect : (dateText) ->
                updateModel(dateText)
        })
)###
@app.directive('fDatepicker', ->
    link: (scope, element, attrs) ->
       element.fdatepicker()
)
@app.directive('fTimepicker', ->
    link: (scope, element, attrs) ->
        element.fdatepicker({
            dateFormat: 'hh:ii p'
        })
)
@app.controller 'WaiversCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'UserAuthFactory', 'AuthenticationFactory',
    ($scope, $http, $window, $location, $timeout, UserAuthFactory, AuthenticationFactory) ->

        baseurl = 'http://localhost:12008/v1/calendar';
        $scope.errpInfo = {}
        $scope.errpInfo.hasError = false;

        $scope.yearFee = {}
        $scope.term = {}
        $scope.termDatas = {}
        $scope.holiday = {}
        $scope.session = {}

        $scope.yearFee.start_date = ""
        $scope.yearFee.end_date = ""
        $scope.yearFee.annual_fee = "1000$"

        $scope.term.name = "FAll 2015"
        $scope.term.start_date = ""
        $scope.term.end_date = ""
        $scope.holiday.holiday = "5/5/2015"


        $scope.set_year_fee = () ->
            $scope.errpInfo.hasError = false
            console.log('start Calender set fee..')
            $http.post baseurl + '/yearfee/create', {
                start_date: $scope.yearFee.start_date,
                end_date: $scope.yearFee.end_date,
                annual_fee: $scope.yearFee.annual_fee
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.create_term = () ->
            $scope.errpInfo.hasError = false
            console.log('start Calender create term...')
            console.log($scope.term)
            $http.post baseurl + '/term/create', {
                name: $scope.term.name,
                start_date: $scope.term.start_date,
                end_date: $scope.term.end_date
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
                $scope.initTerm()
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.add_holiday = () ->
            $scope.errpInfo.hasError = false
            console.log($scope.holiday)
            console.log('start Calender set holiday...')
            $http.post baseurl + '/holiday/create', {
                holiday: $scope.holiday.holiday
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.add_session = () ->
            console.log('start Calender create session...')
            console.log(session)
            $http.post baseurl + '/session/create', {
                id_term: $scope.session.id_term,
                name: $scope.session.name,
                start_date: $scope.session.start_date,
                end_date: $scope.session.end_date,
                id_program: $scope.session.id_program,
                start_time: $scope.session.start_time,
                end_time: $scope.session.end_time,
                slots: $scope.session.slots,
                hourly_rate: $scope.session.hourly_rate
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.initTerm = () ->
            $http.post baseurl + '/term/init', { }
            .success (data) ->
                $scope.termDatas = data.data
                console.log("init term data",$scope.termDatas)
            .error (status) ->

        $scope.pageInit = () ->
            $scope.initTerm()

        angular.element(document).ready( () ->
            $scope.pageInit()
        )
]
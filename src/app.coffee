@app = angular.module 'application', [
	# Angular libraries
	'ui.router',
	'ngAnimate',
	# Foundation UI components
	'foundation',
	# Routing with front matter
	# 'foundation.dynamicRouting'
	# Transitioning between views
	# 'foundation.dynamicRouting.animations'
	]

@app.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlProvider, $locationProvider) ->
	$stateProvider
	.state '/home', {
		url: '/home'
		templateUrl: '/templates/home.html'
		controller: 'HomeCtrl'
	}
	.state '/login', {
        url: '/login'
        templateUrl: '/templates/login.html'
        controller: 'LoginCtrl'
  }
	.state '/information', {
		url: '/information'
		templateUrl: '/templates/information.html'
		controller: 'MyInfoCtrl'
	}
	.state '/classes', {
		url: '/classes'
		templateUrl: '/templates/classes.html'
		controller: 'ClassesCtrl'
	}
	.state '/payments', {
		url: '/payments'
		templateUrl: '/templates/payment.html'
		controller: 'PaymentCtrl'
	}
	.state '/forms-waivers', {
		url: '/forms-waivers'
		templateUrl: '/templates/forms_waivers.html'
		controller: 'WaiversCtrl'
	}
	.state '/enrollment', {
		url: '/enrollment'
		templateUrl: '/templates/enrollment.html'
		controller: 'EnrollmentCtrl'
	}

	# Default to the index view if the URL loaded is not found
	$urlProvider.otherwise('login');
	# Use this to enable HTML5 mode
	$locationProvider.html5Mode {
		enabled: false,
		requireBase: false
	}
	# Use this to set the prefix for hash-bangs
	# Example: example.com/#!/page
	$locationProvider.hashPrefix '!'
]
# run () ->
# 	# Enable FastClick to remove the 300ms click delay on touch devices
# 	FastClick.attach document.body

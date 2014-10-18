/**
* Created with oauthDance.
* User: iogbole
* Date: 2014-10-16
* Time: 03:28 PM
* To change this template use Tools | Templates.
*/

var app = angular.module('app', ['yApp']);

var yApp = angular.module('yApp', ['ngResource', 'ngCookies'])

yApp.factory('yFactory', function($resource, $cookies, $http) {
var y_token =  $cookies.y_new_token;
        if (y_token === undefined) {
         //add some redirects here
          alert ("No yammer token present, please login /login"); 
            return;
        } else {
          // alert ("Token_value is NOT blank " +y_token); 
          //set authorization header
          var oauthString = "Bearer "+y_token; 
          //  alert (oauthString); 
          //set aouth header
          $http.defaults.headers.common['Authorization'] = oauthString;    
         return $resource('https://api.yammer.com/api/v1/users/:Id.json',
       
		{ Id:'@_id' }, 
		
		{ update: { method: 'PUT' }}
        );
                           
        }

});


yApp.controller('y_usersController', function($scope,yFactory) {
	
		$scope.users = yFactory.query(); 
});


// learning global variables
yApp.run(function ($rootScope) {
    $rootScope.message = ''; //global variable
});

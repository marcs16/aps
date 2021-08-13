// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require fcalendar
//= requite adminlte
//= require navbar/vendor/modernizr-2.8.3-respond-1.4.2.min.js
//= require navbar/main.js
//= require login/login.js
//= require device/devicesdt
//= require salary/salariesdt
//= require salary/salaries.js
//= require user/usersdt
//= require user/user.js
//= require device/device.js
//= require select2/selects.js
//= require select2/select2.js
//= require select2/select2.full.js
//= require languages
//= require call_ajax
//= require turbolinks
//= require datatables
//= require dropzone
//= require toastr/toastr.js
//= require ckeditor/config.js
//= require_tree .

$(document).ready(function() {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "4000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
});

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
//= require plugins/jquery.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require plugins/popper.js
//= require plugins/bootstrap.min
//= require plugins/select2.full.min
//= require plugins/jquery.scrollbar.min
//= require plugins/listjs.min
//= require plugins/moment.min
//= require plugins/daterangerpicker
//= require plugins/bootstrap-datepicker.min
//= require plugins/toastr.min
//= require configs/pace.min
//= require main/atomos.min
//= require plugins/jquery-ui.min
//= require plugins/jquery.maskMoney.min


document.addEventListener("turbolinks:load", function () {
  $(document).ready(function () {
    $('.select2').select2();
     $(".money").maskMoney({
       prefix: "R$: ",
       decimal: ",",
       thousands: "."
     });

    $(".js-datepicker").datepicker();
    $('.dropdown-toggle').dropdown();
    $('.nav-link').dropdown();
  });
});


toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-bottom-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}

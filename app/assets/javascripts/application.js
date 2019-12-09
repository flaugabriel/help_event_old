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
//= require plugins/toastr.min
//= require configs/pace.min
//= require main/atomos.min
//= require plugins/jquery-ui.min
//= require plugins/jquery.maskMoney.min
//= require plugins/bootstrap-datepicker.min
//= require plugins/bootstrap-datepicker.pt-BR.min
//= require plugins/bootstrap-datetimepicker.min
//= require plugins/bootstrap-datetimepicker.pt-BR.min

document.addEventListener("turbolinks:load", function () {
  $(document).ready(function () {
    $('.select2').select2();
    $('.nav-link').dropdown();
      $("#imgInp").change(function () {
        readURL(this);
      });
     $(".money").maskMoney({
       prefix: "R$: ",
       decimal: ",",
       thousands: "."
     });
    $('.dropdown-toggle').dropdown();

    $('.datetime').datepicker({
      format: 'dd/mm/yyyy',
      language: 'pt-BR',
      todayHighlight: true,
      autoclose: true,
      showOptions: {
        direction: "down"
      }
    });

    $('.timedate').datetimepicker({
      format: 'dd/mm/yyyy hh:ii',
      language: 'pt-BR',
      todayHighlight: true,
      autoclose: true,
      showOptions: {
        direction: "down"
      }
    }).focus;

    $("#search").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $(".text").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
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

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#blah').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}




// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require jquery.csv.js
//= require select2
//= require d3
//= require_tree .

function ready(){
    $("#menu").slicknav({
        prependTo:'.slicknav',
        label: "Navigation"
    });

    $('.datatable').DataTable({
        responsive: true,
        autoWidth: false,
        pageLength: 100
    });

    $('.select2').select2({ placeholder: 'Search for your institution.'});
}

$(document).ready(ready);
$(document).on('page:load', ready);



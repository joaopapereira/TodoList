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
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require gritter

$(document).ready(function () {
    
    /*$(function(){
      /*$('#form-signin').submit(function(e){
        $('#form-signin').validate()
        return false;
      });
      
      $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
    });*/
       
        $.extend($.datepicker,{_checkOffset:function(inst,offset,isFixed){return offset}});

        var $datapickeroptions = {
            scontrolType: 'select',
            dateFormat: 'dd/mm/yy',
            timeFormat: 'hh:mm'
        };
        
        if($("#new_todo :input#datetimepicker1").get(0)){
            $('#new_todo :input#datetimepicker1').datetimepicker($datapickeroptions);
            $("#new_todo :input#datetimepicker1").datetimepicker('setDate', $('#new_todo :input#datetimepicker1"').val());
        }
        if($(".edit_todo :input#datetimepicker1").get(0)){
            $('.edit_todo :input#datetimepicker1').datetimepicker($datapickeroptions);      
            $(".edit_todo :input#datetimepicker1").datetimepicker('setDate', $('.edit_todo :input#datetimepicker1"').val());
        }
        
      
    $('.todo_delete').click (function () {
		return confirm ("Are you sure you want to " + $(this).attr ("title") + "?") ;
	}) ;
});

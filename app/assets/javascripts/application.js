// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
    $("#follower_email").css("display","none");
    $("#massmail_choose_one_followers").click(function(e){
        $("#customer_email").css("display","none");
        $("#select_customer").css("display","none");
        $("#follower_email").css("display","block");
        $("#select_follower").css("display","block");
        $("#customer_email").val("");
    });
    $("#massmail_choose_one_samecounty").click(function(e){
        $("#follower_email").css("display","none");
        $("#select_follower").css("display","none");
        $("#customer_email").css("display","block");
        $("#select_customer").css("display","block");
        $("#follower_email").val("");
    });
});





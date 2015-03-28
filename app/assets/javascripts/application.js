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

$(function(){
	//ログインページのフォーカス処理
	$('#log_in_name').focus();
	
	//カード作成ページのフォーカス処理
	$('#card_question').focus();
	
	//カードの答えを全部開く
	$('#open').click(function(){
		$('tr.card').each(function(){
			var answer = $(this).data('answer');
	  		$(this).children("td:last-child").text(answer);
		});
	});
	//カードの答えを全部閉じる
	$('#close').click(function(){
		$('tr.card').each(function(){
	  		$(this).children("td:last-child").text("Clickすると答えが開きます");
		});
	});
//単語帳カードの答えをクリックで開く、閉じる
	$('tr.card').click(function(){
		var answer = $(this).data('answer');
		var current_text = $(this).children('td:last-child').text();
		
		if (answer != current_text){
			$(this).children("td:last-child").text(answer);
		}else{
			$(this).children("td:last-child").text("Clickすると正解が開きます");
		}
	});
});
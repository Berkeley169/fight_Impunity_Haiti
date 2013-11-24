//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require ckeditor-jquery
//= require_tree .

window.onload = function() {
	$('.dropdown-toggle').dropdown();
	if ($('#sidebar')[0] != undefined) {
   		$('#main_content')[0].style.float = 'left';
	}
};


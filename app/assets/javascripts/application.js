//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require ckeditor-jquery
//= require_tree .

function displayLang(lang){
	var lang_text = '#display_text_'.concat(lang);
	var lang_info = '#doc_info_'.concat(lang);
	doc_infos = $('.doc_info');
	display_texts = $('.display_text');
	displaySection(doc_infos,lang_info)
	displaySection(display_texts,lang_text)
}

function displaySection(toHideList,toShow) {
	if ($(toShow)[0] != undefined) {
		for (var i = 0; i<toHideList.length; i++) {
			toHideList[i].style.display ='none';
		}
		$(toShow)[0].style.display = 'block';
	}
}

window.onload = function() {
	$('.dropdown-toggle').dropdown();
	if ($('#sidebar')[0] != undefined) {
   		$('#main_content')[0].style.float = 'left';
	}
	if ($('.relevant_lang')[0] != undefined) {
		displayLang($('.relevant_lang')[0].id)
	}
	var imgs = $('.img_trigger')
	for (var j=0; j<imgs.length; j++) {
		imgs[j].onclick = function() {
			displayLang(this.id)
		}
	}
};


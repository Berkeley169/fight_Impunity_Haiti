//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require ckeditor-jquery
//= require_tree .

function toggleLang(lang){
	var edit_doc = $('#doc_edit_'.concat(lang))[0];
	if (edit_doc != undefined) {
		if (edit_doc.style.display != 'none') {
			edit_doc.style.display = 'none'
		}
		else {
			edit_doc.style.display = 'block'
		}
	}
}

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
		displaySection($('.doc_edit'),$('#doc_edit_'.concat($('.relevant_lang')[0].id))[0])
		$('#'.concat($('.relevant_lang')[0].id))[0].style.background = 'black'
	}
	var trigger_flags = $('.img_trigger')
	for (var j=0; j<trigger_flags.length; j++) {
		trigger_flags[j].onclick = function() {
			displayLang(this.id)
			for (var i=0; i<trigger_flags.length; i++){
				trigger_flags[i].style.background = 'none'
			}
			this.style.background = 'black'
		}
	}
	var toggle_flags = $('.img_toggle')
	for (var j=0; j<toggle_flags.length; j++) {
		toggle_flags[j].onclick = function() {
			toggleLang(this.id)
			if (this.style.background == 'black') {
				this.style.background = 'none'
			}
			else {
				this.style.background = 'black'
			}
		}
	}
};


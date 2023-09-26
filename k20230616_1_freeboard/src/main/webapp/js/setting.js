
function setting(idx, mode, title, name, content) {
	let frm = document.commentForm;
	frm.idx.value = idx;
	frm.mode.value = mode;
	frm.commentBtn.value = title;
	frm.name.value = name;
//	frm.content.value = content;
//	frm.content.value = content.replace('<br/>', '\r\n');
	while(content.indexOf('<br/>') != -1) {
		content.replace('<br/>', '\r\n');
	}
	frm.content.value = content;
}

























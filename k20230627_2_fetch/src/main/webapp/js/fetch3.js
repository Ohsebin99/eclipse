function fetchAjax(pageName) {
	fetch(pageName)
			.then(response =>{
				if (response.status == 200) {
					response.text()
					.then(function (text){
						document.querySelectorAll('div')[0].innerHTML = text;
					});
				} else {
					document.querySelectorAll('div')[0].innerHTML = '요청 실패!';
				}
			});
}

function fetchAjax(summary) {
	fetch(summary)
			.then(response =>{
				if (response.status == 200) {
					response.text()
					.then(function (text){
						document.querySelectorAll('div')[0].innerHTML = text;
					});
				} else {
					document.querySelectorAll('div')[0].innerHTML = '요청 실패!';
				}
			});
}

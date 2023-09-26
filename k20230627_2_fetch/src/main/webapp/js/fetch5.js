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

//	페이지가 로드되거나 새로고침 될 때 해시가 없으면 summary 파일에 저장된 내용을 표시하고 해시가 있으면
//	지정된 파일의 내용을 표시한다.

// javascript onload
/*
onload = function () {
	console.log('location.hash: ' + location.hash);
	if(location.hash) {
		fetchAjax(location.hash.substring(2));
	} else {
		fetchAjax('summary');
	}
}
*/

// jQuery onload
$(() => {
	if(location.hash) {
		fetchAjax(location.hash.substring(2));
	} else {
		fetchAjax('summary');
	}
// list 파일의 내용을 읽어서 <ol id="list"> ~ </ol> 사이에 넣어주는 fetch
/*
	fetch('list')
			.then(response =>{
				if (response.status == 200) {
					response.text()
					.then(function (data){
						$('#list').html(data);
					});
				} else {
					alert('응답 실패');
				} 
			});
			*/
//	위와 같이 then() 내부에 then()이 나오는 기법을 nested라 한다.

//	then()이 리턴한 결과를 외부에서 다른 then()이 받아서 처리하는 기법을 chaining이라 한다.
	fetch('list')
		.then(function (res){
			if(res.status == 200) {
				return res.text();
			}else {
				alert('응답 실패');
			}
		})
		.then(function (data) {
			$('#list').html(data);
		});
		
// list2 파일의 내용을 읽어서 <ol id="list"> ~ </ol> 사이에 넣어주는 fetch
/*	
	fetch('list2')
		.then(function(res) {
			res.text()
				.then(function (data){
					// split() 함수를 사용해서 ','를 경계로 문자열을 분리해서 배열로 리턴한다.
					let obj = data.split(',');
					
					// <ol> 태그 내부에 출력할 태그 목록을 만든다.
					// <li><a href="#!1" onclick="fetchAjax('1')">1절 가사</a></li>
					let items = '';
					for (let i=1; i<=obj.length; i++) {
						let item = '<li><a href="#!1' + i + '" onclick="fetchAjax(\'' + i + '\')">' +
									obj[i - 1] + '</a></li>';
					console.log(item);
					items += item;
					}
					$('#list2').html(items);
				});
		});
		*/
		
		/*
	fetch('list2')
		.then(res =>{
			res.text()
				.then(data => {
					let obj = data.split(',');
					let items = '';
					for (let i=1; i<=obj.length; i++) {
						let item = '<li><a href="#!1' + i + '" onclick="fetchAjax(\'' + i + '\')">' +
									obj[i - 1] + '</a></li>';
					items += item;
					}
					$('#list2').html(items);
				});
		});
		*/
		
	fetch('list2')
		.then(function (res) {
			return res.text();
		})
		.then(function (data){
			let obj = data.split(',');
			let items = '';
			for (let i = 1; i <= obj.length; i++) {
				let item = '<li><a href="#!1' + i + '" onclick="fetchAjax(\'' + i + '\')">' +
					obj[i - 1] + '</a></li>';
				items += item;
			}
			$('#list2').html(items);
		});
});




























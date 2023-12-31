/* 다음 API */
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

document.addEventListener("DOMContentLoaded", function() {
   
    var searchButton = document.getElementById("searchButton");
    searchButton.addEventListener("click", function() {
        var searchValue = document.getElementById("searchInput").value;
		console.log("Search value: " + searchValue);
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(searchValue , placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
		
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
    });
});

/*==================현재 시간 찍어주는 코드 ===================*/

$(() =>{
   let now = new Date();
   let currentHour = now.getHours();
   let currentMinute = now.getMinutes();

   let hour = String(currentHour).padStart(2, "0");
   let minute = String(currentMinute).padStart(2, "0");

   $('input[name=mealTime]').val(`${hour}:${minute}`);
   
   $('input[name=limitNum]').on('click', function() {
		$(this).val('');
	});
   $('input[name=minLimitAge]').on('click', function() {
		$(this).val('');
	});
   $('input[name=maxLimitAge]').on('click', function() {
		$(this).val('');
	});
});

// 파일 업로드 함수 시작
	function photoView(event) {
		$('#output').attr('src', URL.createObjectURL(event.target.files[0]));
	}
	
	function updateValue(value) {
	    document.getElementById("limitValue").textContent = value;
	}
	
	
	function photoView(event) {
	   $('#output').attr('src', URL.createObjectURL(event.target.files[0]));
	}
	function updateValue(value) {
	    document.getElementById("limitValue").textContent = value;
	}
// 파일 업로드 함수 끝

/*=================날짜 제한 시작 ===========================*/

function dateOK() {
  let mealDate = $('input[name=mealDate]');
  let today = new Date();
  // 선택한 날짜가 오늘 이전인 경우
    let minDate = new Date(today);
    minDate.setDate(minDate.getDate()); // 전날을 선택할 수 없도록 설정

    let year = minDate.getFullYear();
    let month = String(minDate.getMonth() + 1).padStart(2, "0");
    let day = String(minDate.getDate()).padStart(2, "0");
    let minDateString = `${year}-${month}-${day}`;
    
      mealDate.attr('min', minDateString);
   
}
/*=================날짜 제한 끝 ===========================*/


/*=================시간 체크 시작===========================*/
function timeOK() {
   let mealTime = $('input[name=mealTime]');
   let now = new Date();

   let currentHour = now.getHours();
   let currentMinute = now.getMinutes();
   let hour = String(currentHour).padStart(2, "0");
   let minute = String(currentMinute).padStart(2, "0");

   let selectedHour = parseInt(mealTime.val().split(':')[0]);
   let selectedMinute = parseInt(mealTime.val().split(':')[1]);

   let mealDate = $('input[name="mealDate"]');
   let selectedDate = new Date(mealDate.val());

   if (selectedDate.toDateString() === now.toDateString()) {
      if (selectedHour < currentHour) {
         alert('시간을 다시 선택해주세요');
         mealTime.val(`${hour}:${minute}`);
      } else if (selectedHour === currentHour && selectedMinute < currentMinute) {
         alert('시간을 다시 선택해주세요');
       	 mealTime.val(`${hour}:${minute}`);
      }
   } 
}
/*=================시간 체크 끝===========================*/

/*================입력 체크 시작 =============================*/
function partyInsertOK (){
   
   let subject =  $('input[name=subject]').val();
   let place = $('input[name=place]').val();
   let content = $('textarea[name=content]').val();
   let category = $('select').eq(0).val();
   let location = $('select').eq(1).val();
   let limitNum = $('input[name=limitNum]').val();
   let mealDate = $('input[name=mealDate]').val();
   let fileName = $('input[name=fileName]').val();
   let minLimitAge = $('input[name=minLimitAge]').val();
   let maxLimitAge = $('input[name=maxLimitAge]').val();
   let pattern = new RegExp('^[0-9]+$');
   
   
   if(fileName == ''){
      alert('사진을 선택하세요');
      return false;
   }
   
   if(subject.length == 0 || subject == ''){
      alert('파티 이름을 입력하세요');
      return false;
   }
   if(minLimitAge.length == 0 || minLimitAge == ''){
      alert('나이을 입력하세요');
      return false;
   }
   
   if(place.length == 0 || place == ''){
      alert('장소를 입력하세요');
      return false;
   }
   
   if(content.length == 0 || content == ''){
      alert('내용을 입력하세요');
      return false;
   }
   if(category == '음식 카테고리'){
      alert('음식 카테고리를 선택하세요');
      return false;
   }
   
   if(location == '전국') {
      alert('지역을 선택하세요');
      return false;
   }
   
   if(limitNum.length == 0 || limitNum == '') {
      alert('인원을 선택하세요');
      return false;
   }
   if(mealDate.length == 0 || mealDate == '') {
      alert('날짜를 선택하세요');
      return false;
   }
   
   if (!pattern.test(limitNum)) {
     alert('인원은 숫자만 입력하세요');
     return false;
   }

   if(!pattern.test(maxLimitAge)){
     alert('나이는 숫자로 입력하세요');
      return false;
   }
   
   if(!pattern.test(minLimitAge)){
     alert('나이는 숫자로 입력하세요');
      return false;
   }
   if(minLimitAge > maxLimitAge) {
     alert('최대 나이보다 최소나이가 더 높습니다.');
      return false;
   }
}
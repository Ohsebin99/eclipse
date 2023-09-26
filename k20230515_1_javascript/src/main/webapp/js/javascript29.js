//   onload 이벤트에 함수를 할당한다.
//   현재 페이지의 모든 내용이 브라우저에 로딩되고 난 후 onload에 할당한 함수가 실행된다.
onload = () => {
//   alert('꺄~~~~~~~~~');
//   button 태그를 찾아서 onclick 이벤트에 함수를 할당한다.
//   이벤트에 함수를 할당할 때 함수 이름뒤에 ()를 적으면 자동 실행 함수가 되서 페이지가 로딩될 때
//   자동으로 실행되기 때문에 ()를 쓰면 안된다.
   document.getElementsByTagName('button')[0].onclick = testDate1;
   document.getElementsByTagName('button')[1].onclick = testDate2;
   document.getElementsByTagName('button')[2].onclick = testDate3;
   document.getElementsByTagName('button')[3].onclick = testDate4;
   document.getElementsByTagName('button')[4].onclick = testDate5;
}

function testDate1() {
   let date = new Date();
   console.log(date);
   
   let today = document.getElementById('today');
   today.innerHTML = date; // Fri Sep 30 2022 10:43:19 GMT+0900 (한국 표준시)
   today.innerHTML = date.toDateString(); // Fri Sep 30 2022
   today.innerHTML = date.toLocaleString(); // 2022. 9. 30. 오전 10:45:19
   today.innerHTML = date.toLocaleDateString(); // 2022. 9. 30.
   today.innerHTML = date.toLocaleTimeString(); // 오전 10:45:42
}

function testDate2() {
   let date = new Date();
   console.log(date);
   
//   let year = date.getYear() + 1900; // 년, 1900을 더해야 한다.
   let year = date.getFullYear(); // 년, 1900을 더할 필요없다.
   let month = date.getMonth() + 1; // 월, 1을 더해야 한다.
   let day = date.getDate(); // 일;
   let week = date.getDay(); // 요일, 0(일요일), 1(월요일), ..., 5(금요일), 6(토요일)
   const weekDay = ['일', '월', '화', '수', '목', '금', '토'];
   let hour = date.getHours(); // 시
   let minute = date.getMinutes(); // 분
   let second = date.getSeconds(); // 초
   let milliSecond = date.getMilliseconds(); // 밀리초
   
   let now = `${year}.${month}.${day}(${weekDay[week]}) ${hour}:${minute}:${second}.${milliSecond}`;
   console.log(now);
   
   let today = document.getElementById('today');
   today.innerHTML = now;
}

function testDate3() {
   let year = 2022;
   let month = 9;
   let day = 30;
   
//   Date 객체를 만들 때 인수로 년, 월, 일, 시, 분, 초를 넣어주면 특정 날짜 객체를 만들 수 있다.
//   Date(년, 월, 일)
   let date = new Date(year, month - 1, day);
   console.log(date);
   document.getElementById('specific').innerHTML = date;
   
//   Date(년, 월, 일, 시, 분, 초)
   date = new Date(year, month - 1, day, 11, 39, 4);
   console.log(date);
   document.getElementById('inputDate').value = date;
}

function testDate4() {
//   지정 날짜를 얻어온다.
   let date1 = document.getElementById('date1').value;
//   console.log(date1);
//   console.log(typeof date1);
//   날짜 연산을 하기 위해서 id 속성이 date로 지정된 객체에 입력된 문자열을 날짜 데이터로 만든다.
   let date = new Date(date1);
   console.log(date);
//   console.log(typeof date);
   
//   경과 날짜를 얻어온다.
   let dateInput = document.getElementById('dateInput').value;
   console.log(dateInput);
//   console.log(typeof dateInput);
   
//   console.log(typeof date.getDate());
//   console.log(date.getDate() + Number(dateInput));
//   console.log(date.getDate() + parseInt(dateInput));

//   setDate(): 날짜를 수정한다.
   date.setDate(date.getDate() + parseInt(dateInput));
   console.log(date.toLocaleDateString());
   document.getElementById('result').value = date.toLocaleDateString();
}

function testDate5() {
//   수료 날짜를 얻어온다.
   let date2 = document.getElementById('date2').value;
   let endDate = new Date(date2);
   console.log(endDate);
   
//   경과 날짜를 얻어온다.
   let dateInput2 = document.getElementById('dateInput2').value;
   let startDate = new Date(dateInput2);
   console.log(startDate);

   let result2 = endDate - startDate;
//   날짜/시간 데이터를 연산하면 두 시간 데이터 연산 결과를 밀리초 단위로 계산한다.
   console.log(result2);
   console.log(result2 / (24 * 60 * 60 * 1000));
   document.getElementById('result2').value = result2 / (24 * 60 * 60 * 1000);
}
















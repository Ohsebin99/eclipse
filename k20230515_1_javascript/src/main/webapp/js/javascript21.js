let ids = ['aaa', 'bbb', 'ccc', 'ddd'];

function confirmChk() {
//   중복 검사할 아이디를 얻어온다.
   let id = document.getElementById('id').value.trim();
//   console.log(id);
   
//   아이디 중복 검사 결과 메시지를 출력할 <div> 태그를 얻어온다.
   let div = document.getElementsByTagName('div')[0];
//   div.innerHTML = id;

//   입력한 아이디가 아이디 목록에 존재하는가 검사한다.
//   indexOf() 함수는 인수로 지정된 데이터가 배열의 몇 번째 index에 위치하나 리턴한다.
//   있으면 데이터의 index를 리턴하고 없으면 -1을 리턴한다.
  if(id.length==0){
      div.innerHTML='<br/><b style="color:red">중복 검사할 아이디를 입력하세요</b>';
   }else if(ids.indexOf(id)>=0){
      div.innerHTML='<br/><b><span style="color:red">'+id+'</span>은 사용 불가능한 아이디</b>';
      
   }else{
      div.innerHTML='<br/><b><span style="color:red">'+id+'</span>은 사용 가능한 아이디</b>'+
      '<input type="button" value="사용하기" onclick="insertID(\'' + id + '\')"/>';

      // 자바스크립트 함수는 변수에 저장된 문자열을 호출하는 함수의 인수로 전달하려면 변수명만
      // 사용하면 안된다.
      // 변수명만 사용하면 변수에 저장된 데이터를 문자열로 인식하는 것이 아니라 변수로 인식해서
      // 변수가 정의되지 않았다는 에러가 발생된다.
      // 변수에 저장된 문자열을 함수의 인수로 전달하려면 변수이름 앞뒤에 따옴표를 붙여서 전달해야
      // 한다. 큰따옴표와 작은따옴표가 모두 사용된 상태일 경우 또 따옴표를 찍어야 한다면 \" 또는
      // \'를 사용한다.
   }
   
//   아이디를 입력하지 않았거나 중복되는 아이디일 경우 아이디를 다시 입력하도록 지우고 포커스를
//   이동시킨다.
   document.getElementById('id').value = '';
//   focus(): 특정 컨트롤로 포커를 이동시킨다.
   document.getElementById('id').focus();
}

function insertID(id) {
   console.log(id);
//   중복 검사를 통과한 아이디를 부모 창으로 넘기고 비밀번호에 포커스를 위치시킨다.
   opener.document.getElementsByName('id')[0].value = id;
   opener.document.getElementsByName('password')[0].focus();
//   중복검사 창을 닫는다.
   self.close();
}










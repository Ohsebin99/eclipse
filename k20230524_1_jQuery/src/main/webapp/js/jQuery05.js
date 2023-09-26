$(() => {
//   input 태그 중에서 type이 text인 요소를 선택해서 배경색 변경하기
//   let inputs=document.getElementsByTagName('input')
   /*let inputs=document.querySelectorAll('input')
   inputs
   
   for(let input of inputs){
      // getAttribute() 인수로 지정된 속성의 속성값을 얻어온다.
      if(input.getAttribute('type')=='text'){
         input.style.backgroundColor='yellowgreen'
      }
   }*/
   


   /*let inputs=document.querySelectorAll('input[type=text]')
   //console.log(inputs.length)
   for(let input of inputs){
         input.style.backgroundColor='yellowgreen'
   }
   */
/*   
   $('input:text').css('backgroundColor', 'dodgerblue')

//   select 태그의 name 속성이 email인 요소에서 change 이벤트가 발생되면 선택된 option의
//   value 값을 name 속성이 addr인 텍스트 상자에 넣는다.

   let email=document.querySelectorAll('select[name=email]')
   email.onchange=()=>{
      let emailvalue= email.options[email.selectedIndex].value;
      //console.log(emailvalue)
      document.querySelectorAll('input[name=addr]')[0].value=emailvalue
   }

   $('select[name=email]').eq(0).change(()=>{
      $('input[name=addr]').val($('select[name=email]:eq(0)>option:selected').val());
   })
*/
   $('select[name=email]:eq(0)').change(function(){
      // 콤보 상자는 1번에 1개만 선택되기 때문에 $('select[name=email]:eq(0) > option:selected')와
      // $(this)는 같은 의미로 사용된다.
      // $(this)는 화살표 함수를 사용할 때 동작되지 않는다.
      let emailValue=$(this).val()
      console.log(emailValue)
      //$('input[name=addr]').val($('select[name=email]:eq(0)>option:selected').val());
   })
   
   /*
//   체크 박스를 체크(클릭)하면 체크된 목록을 출력한다.
   let hobby1 = document.getElementsByName('hobbies')[0];
   let hobby2 = document.getElementsByName('hobbies')[1];
//   let hobby3 = document.getElementsByName('hobbies')[2];});
   let hobby3 = document.querySelectorAll('input[name=hobbies]')[2];
   
   hobby1.onclick=()=>hobbyCheck()
   hobby2.onclick=()=>hobbyCheck()
   hobby3.onclick=()=>hobbyCheck()
   */
  
  /*
  	$('input:checkbox[name=hobbies]').click(() => {
		 let msg = []; 
		 //	each(): 선택된 요소들의 index와 요소 자체를 리턴하며 인수로 지정한 함수를 반복 실행한다.
		 
		 $('input:checkbox[name=hobbies]').each(function (index, obj){
			// console.log(`index: ${index}, obj: ${obj}`);
			msg.push($('input:checkbox[name=hobbies]:checked').eq(index).val())
		 });
		 console.log(msg.length == 0 ? '없음' : msg.join(', '));
	  });
  	*/
  	$('input:checkbox[name=hobbies]').click(() => {
		let msg = []; 
		//	인수의 순서상 변수가 나와야 하는데 사용하지 않을 경우 '_'로 처리한다.
		 $('input:checkbox[name=hobbies]:checked').each((_, obj) => {
			// console.log(`index: ${index}, obj: ${obj}`);
			msg.push(obj.value);
		 });
		 console.log(msg.length == 0 ? '없음' : msg.join(', '));
	  });
});


function hobbyCheck() {
   /*let hobbies = document.getElementsByName('hobbies');
//   let msg = '';
   let msg = [];
   for (let hobby of hobbies) {
      if (hobby.checked) {
         // msg += hobby.value + ' ';
         msg.push(hobby.value);
      }
   }
//   console.log(msg.length == 0 ? '없음' : msg);
   console.log(msg.length == 0 ? '없음' : msg.join(', '));

*/  
	
   let hobbies=$('input[name=hobbies]:checked')
   let msg=[];
   for (let hobby of hobbies) {
      if (hobby.checked) {
         // msg += hobby.value + ' ';
         msg.push(hobby.value);
      }
      console.log(msg.length == 0 ? '없음' : msg.join(', '));
   }


}
















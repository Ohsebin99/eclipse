function loginCheck(page) {
    var mo = window.mo; // 변수 mo는 JSP 파일에서 전달됩니다.

    if (mo == null || mo == "") {
        alert("로그인이 필요한 서비스입니다.");
        location.href = "login-register/login.jsp";
    } else if (page == 'partyInsert') {
        location.href = "partyInsert.jsp";
    } else if (page == 'mylist') {
        location.href = "mylist.jsp";
    }
}
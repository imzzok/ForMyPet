/**
	회원가입 관련 공통 함수
 */

function removeUser(userId) {
    
    if ( confirm(userId + " 회원님을 삭제하시겠습니까?") ) {
		var f = document.getElementById('userInfoForm');
        f.removeUserId.value = userId;
        f.submit();
    } else {
        // 취소(아니오) 버튼 클릭 시 이벤트
    }
}
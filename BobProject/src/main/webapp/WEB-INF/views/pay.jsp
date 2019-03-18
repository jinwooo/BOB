<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
$("#paycheck").click(function(){
			
			var IMP = window.IMP; // 생략가능
			IMP.init("imp57326351"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		
			IMP.request_pay({
			    pg : 'nice',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',				//제품명
			    amount : 140,						//금액
			    buyer_email : 'iamport@siot.do',	//구매자이메일
			    buyer_name : '이광석',				//구매자이름
			    buyer_tel : '010-1234-5678',		//구매자연락처
			    buyer_addr : '서울특별시 강남구 삼성동',		//구매자주소
			    buyer_postcode : '123-456',			//구매자우편번호
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete' //결제한뒤에 이동할 위치
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        //location.href = "controller.do?command=sale&my_id="+my_id+"&addr="+addr+"&basseq="+basseq;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			});
	})
	})
	
</script>

<body>

	<input type="button" value="결제를해보자!!" id="paycheck"/>

</body>
</html>
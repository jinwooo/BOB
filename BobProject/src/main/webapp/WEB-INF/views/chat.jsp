<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="resources/js/chat.js"></script>

<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link href="resources/css/chat.css" rel="stylesheet">
</head>
<body>
	<%-- <%@ include file="form/header.jsp" %> --%>
	<div class="container clearfix">
		<div class="people-list" id="people-list">
			<div class="chatlist" id="chatlist">
				<div class="myprofile">
					<span class="mytitle">내 프로필</span>

					<c:choose>
						<c:when test="${user.user_img == null }">
							<i class='fas fa-user-circle fa-4x'></i>
						</c:when>
						<c:otherwise>
							<img src="${user.user_img }" alt="avatar" />
						</c:otherwise>
					</c:choose>

					<div class="about">
						<div class="name">${user.user_name }</div>
						<div class="status">
							<i class="fa fa-circle online"></i> online
						</div>
					</div>
				</div>
				<!-- 				<div class="chatmenu">
					<span onclick="list()">USER LIST</span> <span onclick="roomlist()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CHAT
						ROOM LIST</span>
				</div> -->
				<div class="search user">
					<input type="text" placeholder="search" /> <i class="fa fa-search"></i>
				</div>
				<ul class="list">

					<c:choose>
						<c:when test="${empty chatuser }">
							<li class="clearfix">
								<div class="about">직원이,,없슴다,,--;</div>
							</li>
						</c:when>
						<c:otherwise>
							<c:forEach items="${chatuser }" var="chatuser">
								<li class="clearfix" data-id="${chatuser.user_id }"
									data-name="${chatuser.user_name }"><c:choose>
										<c:when test="${chatuser.user_img == null }">
											<i class='fas fa-user-circle fa-4x'></i>
										</c:when>
										<c:otherwise>
											<img src='${chatuser.user_img }' alt='avatar'>
										</c:otherwise>
									</c:choose>

									<div class="about">
										<div class="name">${chatuser.user_name }</div>
										<div class="status">
											<i class="fa fa-circle online"></i> online
										</div>
									</div></li>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</ul>

				<!-- 				<ul class="roomlist" style="display: none;">
					<li><div class="name">test</div></li>
					<li class="clearfix"><img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_02.jpg"
						alt="avatar" />
						<div class="about">
							<div class="name">Aiden Chavez</div>
							<div class="status">
								<i class="fa fa-circle offline"></i> left 7 mins ago
							</div>
						</div></li>
				</ul> -->
			</div>
		</div>

		<div class="emptychat">
			<img src="resources/image/chat_bubble.png">
		</div>

		<div class="chat">
			<!-- chat header -->
			<div class="chat-header clearfix">
				<input id="roomNum" type="hidden"> <img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_02.jpg"
					alt="avatar" />

				<div class="chat-close">
					<i class="fa fa-times"></i>
				</div>

				<div class="chat-about">
					<div class="chat-with"></div>
					<div class="chat-num-messages">already 1 902 messages</div>
				</div>
			</div>
			<!-- end chat-header -->

			<div class="chat-history">
				<ul>

				</ul>

			</div>
			<!-- end chat-history -->

			<div class="chat-message clearfix">
				<textarea name="message-to-send" id="message-to-send"
					placeholder="Type your message" rows="3"></textarea>

				<button id="sendBtn">Send</button>

			</div>
			<!-- end chat-message -->

		</div>
		<!-- end chat -->

	</div>
	<!-- end container -->

	<script id="message-template" type="text/x-handlebars-template">
  <li class="clearfix">
    <div class="message-data align-right">
      <span class="message-data-time" >{{time}}</span> &nbsp; &nbsp;
      <span class="message-data-name" >{{name}}</span> <i class="fa fa-circle me"></i>
    </div>
    <div class="message other-message float-right">
      {{message}}
    </div>
  </li>
</script>

	<script id="message-response-template"
		type="text/x-handlebars-template">
  <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> {{name}}</span>
      <span class="message-data-time">{{time}}</span>
    </div>
    <div class="message my-message">
      {{message}}
    </div>
  </li>
</script>


</body>
</html>
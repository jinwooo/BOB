<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script type="text/javascript">
	
	$(function() {
		
		$(".chat").hide();
		
		var my_id = '${user.user_id}';

		var target_id = null;
		var target_name = null;
		
		$(".list .clearfix").click(function() {
			
			chat.$chatHistoryList.children().remove();
					
			target_id = $(this).data("id");
			target_name = $(this).data("name");
			console.log(target_id)

			$(".emptychat").hide();
			$(".chat").show();
			$(".chat-with").text(target_name);
			
			$.ajax({
				type : "post",
				url : "roomNum.do",
				data : "user_id=" + my_id + "&target_id=" + target_id,
				success : function(data) {
					
					if(data.ch_roomno != null){
						// 채팅방 번호 가져오기
						$("#roomNum").val(data.ch_roomno);
						var roomNum = $("#roomNum").val();
						
						// 방번호가 있을 때 채팅 메세지 가져오기
						var msglist = data.msglist
						$.each(msglist, function (i) {
							
							
							var context = {
								message : msglist[i].ch_msg,
								time : msglist[i].ch_time,
								name : msglist[i].user_id
							};
							
							var template = Handlebars.compile($("#message-template").html());
							var templateResponse = Handlebars.compile($("#message-response-template").html());
							
							if(context.name != my_id){
								chat.$chatHistoryList.append(templateResponse(context));
							} else {
								chat.$chatHistoryList.append(template(context));
							}
							
							chat.scrollToBottom()
						});
					}
				},
				error : function() {
					alert("채팅방 불러오기 실패")
				}
			});
		});

		$(".chat-close").click(function() {
			$(".chat").hide();
			$(".emptychat").show();
		})

		var sock;
		
		// 채팅
		var chat = {
			messageToSend : '',
			init : function() {
				
				sock = new SockJS("<c:url value="/echo"/>");
				sock.onmessage = chat.onMessage;
				sock.onclose = chat.onClose;
				
				this.cacheDOM();
				this.bindEvents();
				this.render();
			},
			cacheDOM : function() {
				this.$chatHistory = $('.chat-history');
				this.$button = $('button');
				this.$textarea = $('#message-to-send');
				this.$chatHistoryList = this.$chatHistory.find('ul');
			},
			bindEvents : function() {
				this.$button.on('click', this.addMessage.bind(this));
				this.$textarea.on('keydown', this.addMessageEnter.bind(this));
			},
			render : function() {
				this.scrollToBottom();
				if (this.messageToSend.trim() != '') {
					var template = Handlebars.compile($("#message-template").html());
					var context = {
						message : this.messageToSend,
						time : this.getCurrentTime(),
						name : my_id
					};
					
					
					
					sock.send(JSON.stringify({
						user_id : my_id,
						ch_msg :  this.messageToSend,
						ch_roomno : $("#roomNum").val()
					}));
					
					
					this.$chatHistoryList.append(template(context));
					this.scrollToBottom();
					this.$textarea.val('');
				} 
			},
			onMessage : function(evt) {
				
				var data = evt.data;
				var sessionid = null;
				var message = null;
				
				// evt 문자열 split
				var strArray = data.split('|');
				
				sessionid = strArray[0];
				message = strArray[1];
				
				if(sessionid != my_id) {
					chat.addResponse(sessionid, message)
				}

			},
			
			addResponse : function(sessionid, message, time) {
				// responses
				var templateResponse = Handlebars.compile($("#message-response-template").html());
				var contextResponse = {
					name : sessionid,
					message : message,
					time : this.getCurrentTime()
				};
				this.$chatHistoryList.append(templateResponse(contextResponse));
				this.scrollToBottom();
			},

			addMessage : function() {
				this.messageToSend = this.$textarea.val()
				this.render();
			},
			addMessageEnter : function(event) {
				// enter was pressed
				if (event.keyCode == 13) {
					this.addMessage();
					return false;
				}
			},
			scrollToBottom : function() {
				this.$chatHistory.scrollTop(this.$chatHistory[0].scrollHeight);
			},
			getCurrentTime : function() {
				return new Date().toLocaleTimeString().replace(
						/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
			}

		};

		chat.init();
		
		
	});

	$(function() {

		// 유저 이름 검색
		var searchFilter = {
			options : {
				valueNames : [ 'name' ]
			},
			init : function() {
				var userList = new List('chatlist', this.options);
				var noItems = $('<li id="no-items-found">No items found</li>');

				userList.on('updated', function(list) {
					if (list.matchingItems.length === 0) {
						$(list.list).append(noItems);
					} else {
						noItems.detach();
					}
				});
			}
		};

		searchFilter.init();

	});

	function list() {
		$(".list").show();
		$(".roomlist").hide();
		$(".search.user").show();
	}

	function roomlist() {
		$(".roomlist").show();
		$(".list").hide();
		$(".search.user").hide();
	}
</script>

<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

*, *:before, *:after {
	box-sizing: border-box;
}

body {
	background: #C5DDEB;
	font: 14px/20px "Lato", Arial, sans-serif;
	padding: 40px 0;
	color: white;
}

.container {
	margin: 0 auto;
	width: 750px;
	background: #444753;
	border-radius: 5px;
}

.people-list {
	width: 260px;
	float: left;
}

.people-list .chatmenu {
	text-align: center;
	padding: 20px 10px 10px 10px;
}

.people-list .search {
	padding: 0 20px 10px 35px;
}

.people-list .chatlist {
	margin: 0;
}

.people-list .chatlist .myprofile {
	display: inline-block;
	padding: 15px 10px;
	border-bottom: 1px dashed;
	width: 90%;
	margin: 0 5% 15px;
}

.people-list .chatlist .myprofile .mytitle {
	display: block;
	padding: 10px 0;
}

.people-list .chatlist .list, .roomlist {
	overflow: auto;
	padding: 0px 20px 20px 20px;
	height: 592px;
}

.people-list input {
	border-radius: 3px;
	border: none;
	padding: 10px;
	color: white;
	background: #6A6C75;
	width: 90%;
	font-size: 14px;
}

.people-list input::placeholder {
	color: white;
}

.people-list .fa-search {
	position: relative;
	left: -25px;
}

.people-list .chatlist .list, .roomlist {
	margin: 0;
}

.people-list .chatlist .list li, .roomlist li {
	padding: 10px 0;
}

.people-list img {
	float: left;
	border-radius: 30px;
	border: 2px solid;
	width: 55px;
	height: 55px;
	background: white;
}

.people-list .fas.fa-user-circle{
	float: left;
	border-radius: 30px;
	width: 55px;
	height: 55px;
}

.people-list .about {
	float: left;
	margin-top: 8px;
}

.people-list .about {
	padding-left: 8px;
}

.people-list .status {
	color: #92959E;
}

.emptychat {
	width: 490px;
	height: 824px;
	float: left;
	background: #eee;
	border-radius: 0 5px 5px 0;
}

.emptychat img {
	width: 250px;
	height: 250px;
	margin: 25%;
}

.chat {
	width: 490px;
	float: left;
	background: #F2F5F8;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	color: #434651;
}

.chat .chat-header {
	padding: 20px;
	border-bottom: 2px solid white;
}

.chat .chat-header img {
	float: left;
	border-radius: 30px;
	border: 2px solid;
	width: 55px;
    height: 55px;
}

.chat .chat-header .chat-about {
	float: left;
	padding-left: 10px;
	margin-top: 6px;
}

.chat .chat-header .chat-with {
	font-weight: bold;
	font-size: 16px;
}

.chat .chat-header .chat-num-messages {
	color: #92959E;
}

.chat .chat-header .chat-close {
	float: right;
}

.chat .chat-history {
	padding: 30px 30px 20px;
	border-bottom: 2px solid white;
	overflow-y: scroll;
	height: 550px;
}

.chat .chat-history .message-data {
	margin-bottom: 15px;
}

.chat .chat-history .message-data-time {
	color: #a8aab1;
	padding-left: 6px;
}

.chat .chat-history .message {
	color: white;
	padding: 18px 20px;
	line-height: 26px;
	font-size: 16px;
	border-radius: 7px;
	margin-bottom: 30px;
	width: 90%;
	position: relative;
}

.chat .chat-history .message:after {
	bottom: 100%;
	left: 7%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: #92959e;
	border-width: 10px;
	margin-left: -10px;
}

.chat .chat-history .my-message {
	background: #92959e;
}

.chat .chat-history .other-message {
	background: #94C2ED;
}

.chat .chat-history .other-message:after {
	border-bottom-color: #94C2ED;
	left: 93%;
}

.chat .chat-message {
	padding: 26px;
}

.chat .chat-message textarea {
	width: 100%;
	border: none;
	padding: 10px 20px;
	font: 14px/22px "Lato", Arial, sans-serif;
	margin-bottom: 10px;
	border-radius: 5px;
	resize: none;
}

.chat .chat-message .fa-file-o, .chat .chat-message .fa-file-image-o {
	font-size: 16px;
	color: gray;
	cursor: pointer;
}

.chat .chat-message button {
	float: right;
	color: #94C2ED;
	font-size: 16px;
	text-transform: uppercase;
	border: none;
	cursor: pointer;
	font-weight: bold;
	background: #F2F5F8;
}

.chat .chat-message button:hover {
	color: #75b1e8;
}

.online, .offline, .me {
	margin-right: 3px;
	font-size: 10px;
}

.online {
	color: #86BB71;
}

z
.offline {
	color: #E38968;
}

.me {
	color: #94C2ED;
}

.align-left {
	text-align: left;
}

.align-right {
	text-align: right;
}

.float-right {
	float: right;
}

.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

ul, li {
	list-style: none;
}
</style>
</head>
<body>
<%-- <%@ include file="form/header.jsp" %> --%>
	<div class="container clearfix">
		<div class="people-list" id="people-list">
			<div class="chatlist" id="chatlist">
				<div class="myprofile">
					<span class="mytitle">내 프로필</span>
					
					<img src="" alt="avatar" />
					<div class="about">
						<div class="name">${user.user_id }</div>
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
								<li class="clearfix" data-id="${chatuser.user_id }" data-name="${chatuser.user_name }">
									<c:choose>
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
									</div>
								</li>
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
				<input id="roomNum" type="hidden">
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_02.jpg" alt="avatar" />

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
					<!-- <li class="clearfix">
						<div class="message-data align-right">
							<span class="message-data-time">10:10 AM, Today</span> &nbsp;
							&nbsp; <span class="message-data-name">Olia</span> <i
								class="fa fa-circle me"></i>

						</div>
						<div class="message other-message float-right">Hi Vincent,
							how are you? How is the project coming along?</div>
					</li>

					<li>
						<div class="message-data">
							<span class="message-data-name"><i
								class="fa fa-circle online"></i> Vincent</span> <span
								class="message-data-time">10:12 AM, Today</span>
						</div>
						<div class="message my-message">Are we meeting today?
							Project has been already finished and I have results to show you.
						</div>
					</li>

					<li class="clearfix">
						<div class="message-data align-right">
							<span class="message-data-time">10:14 AM, Today</span> &nbsp;
							&nbsp; <span class="message-data-name">Olia</span> <i
								class="fa fa-circle me"></i>

						</div>
						<div class="message other-message float-right">Well I am not
							sure. The rest of the team is not here yet. Maybe in an hour or
							so? Have you faced any problems at the last phase of the project?
						</div>
					</li>

					<li>
						<div class="message-data">
							<span class="message-data-name"><i
								class="fa fa-circle online"></i> Vincent</span> <span
								class="message-data-time">10:20 AM, Today</span>
						</div>
						<div class="message my-message">Actually everything was
							fine. I'm very excited to show this to our team.</div>
					</li>
 -->
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
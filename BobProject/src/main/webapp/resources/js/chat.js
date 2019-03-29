	
	$(function() {
		
		$(".chat").hide();
		
		var my_id = $(".myprofile .about .name").text();

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
			var clickimg = $(this).find("img").attr("src");
			if(clickimg != null){
				$(".chat-header .img").html("<img src='"+clickimg+"'>");
			} else {
				$(".chat-header .img").html("<i class='fas fa-user-circle fa-4x'>");
			}
			
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
				
				//sock = new SockJS("<c:url value="/echo"/>");
				sock = new SockJS("/proj/echo");
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
				var date = new Date().toLocaleDateString();
				var time = new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
				
				return date.substring(0,11) + " " + time;
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
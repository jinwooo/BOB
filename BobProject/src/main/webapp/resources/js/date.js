
        var monthNames = {
            0: "01",
            1: "02",
            2: "03",
            3: "04",
            4: "05",
            5: "06",
            6: "07",
            7: "08",
            8: "09",
            9: "10",
            10: "11",
            11: "12"
        }

        function Cal() {
            this.date = {};
            this.markup = {};
            this.date.today = new Date();
            this.date.today = new Date(this.date.today.getUTCFullYear(),this.date.today.getUTCMonth(),this.date.today.getUTCDate());
            this.date.browse = new Date();
            this.markup.row = "row";
            this.markup.cell = "cell";
            this.markup.inactive = "g";
            this.markup.currentMonth = "mn";
            this.markup.slctd = "slctd";
            this.markup.today = "today";
            this.markup.dayArea = "dayArea";
            this.elementTag = 'calendar';
            this.targetInput = '#hbdsdf';
            this.init = false;
            this.buildDOM();
            this.selectDate(this.date.today.getFullYear(),this.date.today.getMonth(),this.date.today.getDate())
            this.constructDayArea();
            this.updateInput('날짜를 선택해주세요','','');


            t = this;
            $(document).ready(function(){
                $(document).click(function(ms){
                    e = $('.'+t.elementTag+' .view');
                    eco = e.offset();
                    if(ms.pageX<eco.left || ms.pageX>eco.left+e.width() || ms.pageY<eco.top || ms.pageY>eco.top+e.height()) {
                        if(!t.init) t.hide(300);
                    }
                });
                $('.'+t.elementTag).on('click','.next-month',function(){
                    t.setMonthNext();
                });
                $('.'+t.elementTag).on('click','.prev-month',function(){
                    t.setMonthPrev();
                });
                $('.'+t.elementTag).on('click','.next-year',function(){
                    t.setYearNext();
                });
                $('.'+t.elementTag).on('click','.prev-year',function(){
                    t.setYearPrev();
                });

                $('.'+t.elementTag).on('click','.jump-to-next-month',function(){
                    t.setMonthNext();
                });
                $('.'+t.elementTag).on('click','.jump-to-previous-month',function(){
                    t.setMonthPrev();
                });

                $('.'+t.elementTag).on('click','.'+t.markup.currentMonth,function(){
                    d = t.selectDate(t.date.browse.getUTCFullYear(),t.date.browse.getUTCMonth(),$(this).html());
                    t.hide(300);
                });

                $('.'+t.elementTag).on('click','.title',function(){
                    t.date.browse = new Date(t.date.today.getTime());
                    t.constructDayArea(false);
                });

                $(t.targetInput).focus(function(){
                    t.show(100);
                    $(this).blur();
                });

            });


        }
        Cal.prototype.wd = function(wd) {
            if(wd==0) return 7
            return wd
        }
        Cal.prototype.buildDOM = function() {
            html = "<div class='clear "+this.elementTag+"'>\n<div class='view'>\n<div class='head'>\n<div class='title'><span class='y'></span>  <span class='m'></span></div>\n</div>\n";
            html += "<div class='row th'>\n<div class='C'>M</div>\n<div class='C'>T</div>\n<div class='C'>W</div>\n<div class='C'>T</div>\n<div class='C'>F</div>\n<div class='C'>S</div>\n<div class='C'>S</div>\n</div>\n<div class='"+this.markup.dayArea+"'>\n";
            html += "</div>\n\n<div class='row nav'>\n\n<i class='btn prev prev-year fa fa-fast-backward'></i>\n<i class='btn prev prev-month fa fa-play fa-flip-horizontal'></i>\n<i class='btn next next-month fa fa-play'></i>\n<i class='btn next next-year fa fa-fast-forward'></i>\n</div>\n</div>\n</div>\n";
            $(html).insertAfter(this.targetInput);
            $(this.targetInput).css('cursor','pointer');
            this.hide(0);
        }
        Cal.prototype.constructDayArea = function(flipDirection) {
            newViewContent = "";
            wd = this.wd(this.date.browse.getUTCDay());
            d = this.date.browse.getUTCDate();
            m = this.date.browse.getUTCMonth();
            y = this.date.browse.getUTCFullYear();

            monthBgnDate = new Date(y,m,1);
            monthBgn = monthBgnDate.getTime();
            monthEndDate = new Date(this.getMonthNext().getTime()-1000*60*60*24);
            monthEnd = monthEndDate.getTime();

            monthBgnWd = this.wd(monthBgnDate.getUTCDay());
            itrBgn = monthBgnDate.getTime()-(monthBgnWd-1)*1000*60*60*24;
            /*itrEnd = monthEnd;
            i = 0;
            while(this.wd(new Date(itrEnd).getUTCDay())!=7) {
                itrEnd += 1000*60*60*24;
                i = i+1;
                if(i>10) break;
            }*/



            i = 1;
            n = 0;
            dayItr = itrBgn;
            newViewContent += "<div class='"+this.markup.row+"'>\n";
            while(n<42) {
                cls = new Array("C",this.markup.cell);
                if(dayItr<=monthBgn) cls.push(this.markup.inactive,"jump-to-previous-month");
                else if(dayItr>=monthEnd+1000*60*60*36) cls.push(this.markup.inactive,"jump-to-next-month");
                else cls.push(this.markup.currentMonth);
                if(dayItr==this.date.slctd.getTime()+1000*60*60*24) cls.push(this.markup.slctd);
                if(dayItr==this.date.today.getTime()+1000*60*60*24) cls.push(this.markup.today);

                date = new Date(dayItr);
                newViewContent += "<div class='"+cls.join(" ")+"'>"+date.getUTCDate()+"</div>\n";
                i += 1;
                if(i>7) {
                    i = 1;
                    newViewContent += "</div>\n<div class='"+this.markup.row+"'>\n";
                }
                n += 1;
                dayItr = dayItr+1000*60*60*24;
            }
            newViewContent += "</div>\n";


            this.changePage(newViewContent,flipDirection);
            $('.'+this.elementTag+' .title .y').html(y+'년');
            $('.'+this.elementTag+' .title .m').html(monthNames[m]+'월');
            return newViewContent;
        }
        Cal.prototype.changePage = function(newPageContent,flipDirection) {

            multiplier = -1;
            mark = "-";
            if(flipDirection) {
                multiplier = 1;
                mark = "+";
            }

            oldPage = $('.'+this.elementTag+' .'+this.markup.dayArea+' .mArea');
            newPage = $("<div class='mArea'></div>").css('left',(-1*multiplier*224)+'px').html(newPageContent);
            $('.'+this.elementTag+' .'+this.markup.dayArea).append(newPage);

            $('.mArea').stop(1,1).animate({
                left: mark+"=224px"
            },300,function(){
                oldPage.remove();
            });
        }
        Cal.prototype.selectDate = function(y,m,d) {
            this.date.slctd = new Date(y,m,d);
            this.updateInput(y,m,d);
            this.constructDayArea(false);
            return this.date.slctd;
        }
        Cal.prototype.updateInput = function(y,m,d) {
            if(m=='') m = '';
            else m = monthNames[m];
            if(d < 10 && d != 0 ) {d = 0+d; }
            $(this.targetInput).val(y+" "+m+" "+d);
            $("#choice_date").attr("value",y+m+d);
        }
        Cal.prototype.getMonthNext = function() {
            m = this.date.browse.getUTCMonth();
            y = this.date.browse.getUTCFullYear();
            if(m+1>11) return new Date(y+1,0);
            else return new Date(y,m+1);
        }
        Cal.prototype.getMonthPrev = function() {
            m = this.date.browse.getUTCMonth();
            y = this.date.browse.getUTCFullYear();
            if(m-1<0) return new Date(y-1,11);
            else return new Date(y,m-1);
        }
        Cal.prototype.setMonthNext = function() {
            m = this.date.browse.getUTCMonth();
            y = this.date.browse.getUTCFullYear();
            if(m+1>11) {
                this.date.browse.setUTCFullYear(y+1);
                this.date.browse.setUTCMonth(0);
            } else {
                this.date.browse.setUTCMonth(m+1);
            }
            this.constructDayArea(false);
        }
        Cal.prototype.setMonthPrev = function() {
            m = this.date.browse.getUTCMonth();
            y = this.date.browse.getUTCFullYear();
            if(m-1<0) {
                this.date.browse.setUTCFullYear(y-1);
                this.date.browse.setUTCMonth(11);
            } else {
                this.date.browse.setUTCMonth(m-1);
            }
            this.constructDayArea(true);
        }
        Cal.prototype.setYearNext = function() {
            y = this.date.browse.getUTCFullYear();
            this.date.browse.setUTCFullYear(y+1);
            this.constructDayArea(false);
        }
        Cal.prototype.setYearPrev = function() {
            y = this.date.browse.getUTCFullYear();
            this.date.browse.setUTCFullYear(y-1);
            this.constructDayArea(true);
        }
        Cal.prototype.hide = function(duration) {
            $('.'+this.elementTag+' .view').slideUp(duration);
        }
        Cal.prototype.show = function(duration) {
            t = this;
            t.init = true;
            $('.'+this.elementTag+' .view').slideDown(duration,function(){
                t.init = false;
            });
        }

        var c = new Cal();
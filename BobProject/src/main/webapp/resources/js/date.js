var date = new Date();
var months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
var days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
var state = 0;

function moveFocus(direction) {
  if (direction === 'next') {
    if (state < 3) {
      state++;
      if (state === 1) {
        $('#year').toggleClass('active', false);
        $('#month').toggleClass('active', true);
      }
      else if (state === 2) {
        $('#month').toggleClass('active', false);
        $('#day').toggleClass('active', true);
      }
      else if (state === 3) {
        $('#day').toggleClass('active', false);
      }
    }
  }
  else if (direction === 'prev') {
    if (state > 0) {
      state--;
      if (state === 0) {
        $('#year').toggleClass('active', true);
        $('#month').toggleClass('active', false);
      }
      if (state === 1) {
        $('#year').toggleClass('active', true);
        $('#month').toggleClass('active', false);
      }
      else if (state === 2) {
        $('#month').toggleClass('active', true);
      }
    }
  }
}

function clearFocus() {
  $('#year').toggleClass('active', false);
  $('#month').toggleClass('active', false);
  $('#day').toggleClass('active', false);
}

function setFocus(newState) {
  if (newState >= 0 && newState < 3) {
    state = newState;

    clearFocus();

    if (state === 0) {
      $('#year').toggleClass('active', true);
    }
    if (state === 1) {
      $('#month').toggleClass('active', true);
    }
    else if (state === 2) {
      $('#day').toggleClass('active', true);
    }
  }
}

function setValue(change) {
  if (state === 0) {
    var y = date.getFullYear();
    date.setFullYear(y + change);
    $('#year').html(date.getFullYear());
  }
  if (state === 1) {
    var m = date.getMonth() + change;
    while (m < 0) m += 12;
    date.setMonth(m % 12);
    $('#month').html(months[date.getMonth()]);
  }
  if (state === 2) {
    var year = date.getFullYear();
    var month = date.getMonth();
    var dim = getDaysInMonth(year, month);
    var d = date.getDate() + change;
    while (d < 0) d += dim;

    var nd = d % dim;
    if (nd === 0) nd = dim;
    date.setDate(nd);
    $('#day').html(date.getDate());
  }
}

function getDaysInMonth(y, m) {
  return (/3|5|8|10/).test(m) ? 30:m === 1 ? (!(y % 4) && y % 100) || !(y % 400) ? 29:28:31;
}

$(function() {
  var virtual_knob = document.getElementById("virtual_knob");
  var mc = new Hammer(virtual_knob);
  var prevAngle = -1;

  mc.on("pan panstart panend tap", function(event) {
    console.log(event.type)
    if (event.type === 'panstart') {
      prevAngle = -90;
    }
    else if (event.type === 'panend' || event.type === 'tap') {
      moveFocus('next');
      virtual_knob.style.transform = 'translateX(-50%) translateY(-50%) rotate(0deg)';
      virtual_knob.style.webkitTransform = 'translateX(-50%) translateY(-50%) rotate(0deg)';
    }
    if (Math.abs(prevAngle - event.angle) > 300)
      prevAngle = -prevAngle;
    var a1 = Math.floor(event.angle / 30);
    var a2 = Math.floor(prevAngle / 30);
    if (a1 != a2) {
      setValue(a1 - a2);
    }

    if (event.type !== 'panend' && event.type !== 'tap') {
      virtual_knob.style.transform = 'translateX(-50%) translateY(-50%) rotate(' + (event.angle + 90) + 'deg)';
      virtual_knob.style.webkitTransform = 'translateX(-50%) translateY(-50%) rotate(' + (event.angle + 90) + 'deg)';
    }
    prevAngle = event.angle;
  });

  $('#year').html(date.getFullYear());
  $('#month').html(months[date.getMonth()]);
  $('#day').html(date.getDate());

  $('#year').click(function () { setFocus(0); });
  $('#month').click(function () { setFocus(1); });
  $('#day').click(function () { setFocus(2); });
});
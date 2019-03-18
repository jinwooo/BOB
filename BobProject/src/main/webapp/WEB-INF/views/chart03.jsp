<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
  font-family: 'Roboto', sans-serif;
  background-color: whitesmoke;
  user-select: none;
  cursor: default;
  color: whitesmoke;
  background: #1d1f20;
}

.donut {
  font-size: 12px;
  line-height: 14px;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  cursor: default;
}

.donut .label {
  fill: whitesmoke;
  font-size: 10px;
  pointer-events: none;
}

.donut .legend text {
  font-size: 10px;
  fill: whitesmoke;
}

.donut .tooltip {
  position: absolute;
  padding: 0.5em;
  font-size: 1em;
  line-height: 1em;
  text-align: center;
  color: #333;
  opacity: 0;
  min-width: 75px;
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0px 0px 1px 0px #ccc;
  pointer-events: none;
  z-index: 5;
}

.donut .tooltip  p {
  padding: 0;
  margin: 5px 0;
}
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<body>
	<div id="chart" class="donut"></div>
	<div style="width: 100%; height: 100px;">
		<input type="button" onclick="location.href='main.do'" value="처음으로"></input>
	</div>	
<script type="text/javascript">
var data = [
	  { key: '단백질', value: 39.10 },
	  { key: '탄수화물', value: 32.51 },
	  { key: '포화 지방', value: 13.68 },
	  { key: '불포화 지방', value: 8.71 }
	];

	var margin = {
	  top: 25,   
	  right: 25,  
	  bottom: 25, 
	  left: 25,   
	};

	var diameter = 300;
	var outerRadius = 150;
	var innerRadius = 100;

	var color = d3.scale.category10()
	  .range(['#828282', '#969696', '#CCaaaaff', '#CC7676ff', '#aaaaff', 'white']);

	var pie = d3.layout.pie()
	  .value(function(d) { return d.value; })
	  .sort(null)
	  .padAngle(0.025);

	var arc = d3.svg.arc()
	  .outerRadius(outerRadius)
	  .innerRadius(innerRadius);

	var svg = d3.select('#chart')
	  .append('svg')
	  .attr('width', diameter + margin.left + margin.right)
	  .attr('height', diameter + margin.top + margin.bottom)
	  .append('g')
	  .attr('transform', 'translate(' + (diameter/2 + margin.left) + ',' + (diameter/2 + margin.top) + ')');

	var tooltip = d3.select('#chart')
	  .append('div')
	  .attr('class', 'tooltip');

	svg.selectAll('path')
	  .data(pie(data))
	  .enter()
	  .append('path')
	  .attr('d', arc)
	  .attr('fill', function(d,i) {
	    return color(d.data.key);
	  })
	  .on('mouseover', function(d, i) {
	    arc.outerRadius(outerRadius+5);
	    d3.select(this)
	      .transition()
	      .duration(250)
	      .attr('d', arc);
	  
	    // Generate tooltip html
	    var tooltipHtml = '';
	    tooltipHtml += '<p>' + d.data.key + '</p>';
	    tooltipHtml += '<p>' + d.data.value + '%</p>';
	    tooltip.html(tooltipHtml)
	    tooltip
	      .style('left', diameter/2 + arc.centroid(d)[0] + 'px')
	      .style('top', diameter/2 + arc.centroid(d)[1] + 'px')

	    // Show tooltip
	    tooltip.transition()
	        .duration(250)
	        .ease('ease-out')
	        .style('opacity', 1);
	  })
	  .on('mouseout', function(d, i) {
	    arc.outerRadius(outerRadius);
	    d3.select(this)
	      .transition()
	      .duration(250)
	      .attr('d', arc);
	  
	    // Hide tooltip
	    tooltip.transition()
	      .duration(250)
	      .ease('ease-out')
	      .style('opacity', 0);
	  })
	  .transition()
	    .duration(500)
	    .attrTween('d', function(d) {
	      var interpolate = d3.interpolate({startAngle: 0, endAngle: 0}, d);
	      return function(t) {
	        return arc(interpolate(t));
	      };
	    })
	    .call(function (transition, callback) {
	      if ( transition.empty() ) {
	        callback();
	      }
	      var n = 0;
	      transition
	        .each(function() { ++n; })
	        .each('end', function() {
	        if ( !--n ) {
	          callback.apply(this, arguments);
	        }
	      });
	    }, function() {
	      renderDonutLabels(data);
	      renderDonutLegend();
	    });

	var renderDonutLabels = function(data) {
	  svg.selectAll('.label').remove();
	  var text = svg.selectAll('.label').data(pie(data));
	  text
	    .enter()
	    .append('text')
	    .attr('class', 'label')
	    .attr('dy', '.4em')
	    .attr('opacity', 0)
	    .attr('text-anchor', 'middle')
	    .text(function(d) {
	      return d.data.value + '%';
	    })
	    .transition()
	      .duration(250)
	      .attr('opacity', 1)
	      .attr('transform', function (d) {
	        return 'translate(' + arc.centroid(d) + ')';
	      });
	  text.exit().remove();
	};

	var renderDonutLegend = function() {
	  var legendRectSize = 20;
	  var legendSpacing = 7;
	  var legendHeight = legendRectSize + legendSpacing;

	  var legend = svg.selectAll('.legend')
	    .data(color.domain())
	    .enter()
	    .append('g')
	    .attr('class', 'legend')
	    .attr('transform', function(d, i) {
	      return 'translate(-35,' + ((i*legendHeight)-65) + ')';
	    });

	  legend.append('rect')
	    .attr('width', legendRectSize)
	    .attr('height', legendRectSize)
	    .attr('rx', 20)
	    .attr('ry', 20)
	    .style('fill', color)
	    .style('stroke', color);

	  legend.append('text')
	    .attr('x', 30)
	    .attr('y', 15)
	    .style('font-size', '14px')
	    .text(function(d) {
	      return d;
	    });
	};
</script>
</body>
</html>
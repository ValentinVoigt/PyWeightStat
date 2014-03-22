## -*- coding: utf-8 -*-
<%inherit file="base.mak"/>

<%block name="content">        
	<img src="${request.static_url('pyweightstat:static/img/scale.png')}">
	<p>
	    <b id="v" title="Stand: ${latest[-1].date}">${latest[-1].weight}</b>
	    <span>kg</span>
	</p>
	<br>
	<img src="${request.static_url('pyweightstat:static/img/planner.png')}">
	<canvas id="chart" width="250" height="120"></canvas>
</%block>

<%block name="bottomInclude">
    <%! from math import ceil %>
    <!-- <script src="${request.static_url('pyweightstat:static/js/jquery-2.1.0.min.js')}"></script>
    <script src="${request.static_url('pyweightstat:static/js/bootstrap-3.1.1.min.js')}"></script> -->
    <script src="${request.static_url('pyweightstat:static/js/chart.min.js')}"></script>
    <script>
	function setVal(flt) {
	    document.getElementById('v').innerHTML = flt.toFixed(1).replace('.', ',');
	}
	function getVal() {
	    return document.getElementById('v').innerHTML.replace(',', '.');
	}
	function tick() {
	    if (curr < dest) {
		curr = curr + 2.0 + 2 * Math.random();
		setVal(curr);

		window.setTimeout(tick, 30);
	    } else {
		setVal(dest);
	    }
	}
	var dest = parseFloat(getVal());
	var curr = 0.0;
	tick();

	var ctx = document.getElementById("chart").getContext("2d");
	var myNewChart = new Chart(ctx);

	var data = {
	    labels : [${", ".join(["'%d.'" % i.date.day for i in latest])|n}],
	    datasets : [
		{
		    fillColor : "rgba(151,187,205,0.5)",
		    strokeColor : "rgba(151,187,205,1)",
		    pointColor : "rgba(151,187,205,1)",
		    pointStrokeColor : "#fff",
		    data : [${", ".join(["%.1f" % i.weight for i in latest])|n}]
		}
	    ]
	}
	new Chart(ctx).Line(data, {
	    pointDotRadius: 3,
	    scaleOverride: true,
	    scaleSteps: 5,
	    scaleStepWidth: ${ceil((_max-_min)/5.0)},
	    scaleStartValue: ${_min-1},
	});
    </script>
</%block>

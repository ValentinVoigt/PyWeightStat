<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <link href="${request.static_url('pyweightstat:static/css/bootstrap-3.1.1.min.css')}" rel="stylesheet">
        <link href="${request.static_url('pyweightstat:static/css/default.css')}" rel="stylesheet">
        <title>PyWeightStat</title>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div id="center">            
            <img src="${request.static_url('pyweightstat:static/img/scale.png')}">
            <p>
                <b id="v" title="Stand: ${latest[-1].date}">${latest[-1].weight}</b>
                <span>kg</span>
            </p>
            <br>
            <img src="${request.static_url('pyweightstat:static/img/planner.png')}">
            <canvas id="chart" width="250" height="120"></canvas>
            <br>
        </div>

        <div id="footer">
            &copy; Valentin Voigt
            chart by <a target="_blank" href="http://www.chartjs.org/">Chart.js</a>,
            icons by <a target="_blank" href="http://icons8.com/download-huge-windows8-set/">icons8</a>
        </div>
        
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
                scaleStepWidth: ${max([(_max-_min)/5, 1])},
                scaleStartValue: ${_min-1},
            });
        </script>
    </body>
</html>

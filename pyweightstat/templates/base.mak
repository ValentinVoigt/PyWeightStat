## -*- coding: utf-8 -*-
<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <link href="${request.static_url('pyweightstat:static/css/bootstrap-3.1.1.min.css')}" rel="stylesheet">
        <link href="${request.static_url('pyweightstat:static/css/default.css')}" rel="stylesheet">
        <title><%block name="title">PyWeightStat</%block></title>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
	<div id="center">            
	    <%block name="content"></%block>
	    <br>
	</div>

        <div id="footer">
            &copy; Valentin Voigt
            chart by <a target="_blank" href="http://www.chartjs.org/">Chart.js</a>,
            icons by <a target="_blank" href="http://icons8.com/download-huge-windows8-set/">icons8</a>
        </div>
        
	<%block name="bottomInclude"></%block>
    </body>
</html>


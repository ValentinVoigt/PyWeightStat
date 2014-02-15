## -*- coding: utf-8 -*-
<%inherit file="base.mak"/>

<%block name="content">
    <h1 class="page-header">Neues Gewicht hinzufügen</h1>
    % if success:
	<div class="alert alert-success">Gewicht wurde erfolgreich gespeichert!</div>
    % endif
    <form class="form-horizontal" role="form" method="post" action="${request.route_url('admin')}">
	<div class="form-group
	% if 'weight' in errors:
	has-error
	% endif
	">
	    <label for="weight" class="col-sm-2 control-label">Gewicht</label>
	    <div class="col-sm-10">
	    <input type="text" class="form-control" name="weight" id="weight" placeholder="Gewicht (mit Punkt als Dezimaltrenner)" value="${request.POST.get('weight') or ''}">
	    </div>
	</div>
	<div class="form-group
	% if 'password' in errors:
	has-error
	% endif
	">
	    <label for="password" class="col-sm-2 control-label">Passwort</label>
	    <div class="col-sm-10">
	    <input type="password" class="form-control" name="password" id="password" placeholder="Passwort">
	    </div>
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	    <button type="submit" class="btn btn-default">Speichern</button>
	    <a href="${request.route_url('home')}" class="btn btn-default">Zurück</a>
	    </div>
	</div>
    </form>
</%block>

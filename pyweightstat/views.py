from pyramid.view import view_config

from .models import Weight, DBSession

import hashlib

@view_config(route_name='home', renderer='pyweightstat:templates/home.mak')
def home(request):
    latest = Weight.get_latest(10)
    _min = min([int(i.weight) for i in latest])
    _max = max([int(i.weight) for i in latest])
    return {'latest': latest, '_min': _min, '_max': _max}

@view_config(route_name='admin', renderer='pyweightstat:templates/admin.mak')
def admin(request):
    errors = []
    success = None
    if 'password' in request.POST:
        ## check password
        pw1 = hashlib.sha256(bytes(request.POST.get('password'), 'utf-8')).hexdigest()
        pw2 = request.registry.settings.get('pyweightstat.admin_password')
        if pw1 != pw2:
            errors.append('password')
            success = False

        ## check weight
        try:
            weight = float(request.POST.get('weight'))
        except ValueError:
            errors.append('weight')
            success = False

        ## save dataset
        if success is None:
            DBSession.add(Weight(weight=weight))
            success = True
    return {'errors': errors, 'success': success}

from pyramid.view import view_config

from .models import Weight

@view_config(route_name='home', renderer='pyweightstat:templates/home.mak')
def home(request):
    latest = Weight.get_latest(10)
    _min = min([int(i.weight) for i in latest])
    _max = max([int(i.weight) for i in latest])
    return {'latest': latest, '_min': _min, '_max': _max}


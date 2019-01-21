from django.shortcuts import render
from django.http import HttpResponse
from django.views import generic
from django.template import Context, loader

from .models import TownCrier, Character
from .filters import CharacterFilter

# Create your views here.
def index(request):
    return HttpResponse("Hello peeps. I is a site.")

class crierView(generic.ListView):
    template_name = 'westmarchSite/crier.html'
    context_object_name = 'post_list'

    def get_queryset(self):
        """ Return the town crier posts """
        return TownCrier.objects.order_by('-PublishDate')

class crierDetailView(generic.DetailView):
    template_name = 'westmarchSite/crier_detail.html'
    model = TownCrier
    context_object_name = 'post'

def CharactersView(request):
    valid_orders = ['Level', 'CharName', 'Class']
    order = request.GET.get('sort', 'Level')
    if valid_orders.count(order) == 0:
        order = 'Level'
    characters = Character.objects.all().order_by(order)
    filter = CharacterFilter(request.GET, queryset=characters)

    context = {
        'characters_view': "active",
        'filter': filter,
        'characters': characters,
    }
    return render(request, 'westmarchSite/characters.html', context)
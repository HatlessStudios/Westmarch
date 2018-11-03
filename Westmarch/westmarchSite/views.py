from django.shortcuts import render
from django.http import HttpResponse
from django.views import generic
from django.template import Context, loader

from .models import TownCrier, Party, Character

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

class partiesView(generic.ListView):
    template_name = 'westmarchSite/parties.html'
    model = Party
    context_object_name = 'parties'

def partyDetails(request, pk):
    party = Party.objects.filter(id=pk)[0]
    party_members = Character.objects.filter(PartyID=pk)

    context = {
        'party': party,
        'people': party_members,
    }
    return render(request, 'westmarchSite/party_detail.html', context)
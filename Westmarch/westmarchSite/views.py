from django.shortcuts import render
from django.http import HttpResponse
from django.views import generic

from .models import TownCrier

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
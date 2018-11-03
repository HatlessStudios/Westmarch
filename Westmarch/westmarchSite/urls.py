from django.urls import path

from . import views

app_name = 'westmarchSite'
urlpatterns = [
    path('', views.index, name='index'),
    path('crier/', views.crierView.as_view(), name='crier'),
    path('crier/<int:pk>/', views.crierDetailView.as_view(), name='crier_detail'),
    path('parties/', views.partiesView.as_view(), name='parties'),
    path('parties/<int:pk>/', views.partyDetails, name='party_detail'),
]
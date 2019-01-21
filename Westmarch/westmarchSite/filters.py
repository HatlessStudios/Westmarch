import django_filters
from .models import Character

class CharacterFilter(django_filters.FilterSet):
    class Meta:
        model = Character
        fields = {
            'Level': ['lt', 'gt'],
            'Class': ['exact'],
        }
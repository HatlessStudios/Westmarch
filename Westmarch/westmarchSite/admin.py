from django.contrib import admin

from .models import TownCrier, Session, World, Region

# Register your models here.

admin.site.register(TownCrier)
admin.site.register(Session)
admin.site.register(World)
admin.site.register(Region)
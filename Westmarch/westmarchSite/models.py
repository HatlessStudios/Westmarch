from django.db import models

# Create your models here.
class Character(models.Model):
    CharName = models.CharField(max_length=40)

class CharacterSession(models.Model):
    CharacterID = models.ForeignKey(Character, on_delete=models.CASCADE)
    SessionID = models.ForeignKey(Session, on_delete=models.CASCADE)

class CharItem(models.Model):
    ItemID = models.ForeignKey(Item, on_delete=models.CASCADE)
    CharID = models.ForeignKey(Character, on_delete=models.CASCADE)

class City(models.Model):
    Name = models.CharField(max_length=40)
    RegionID = models.ForeignKey(Region, on_delete=models.CASCADE)

class CityItem(models.Model):
    CityID = models.ForeignKey(City, on_delete=models.CASCADE)
    ItemID = models.ForeignKey(Item, on_delete=models.CASCADE)

class GM(models.Model):
    Name = models.CharField(max_length=40)

class Item(models.Model):
    Name = models.CharField(max_length=40)
    Description = models.CharField(max_length=255)

class Player(models.Model):
    Name = models.CharField(max_length=40)

class Region(models.Model):
    Name = models.CharField(max_length=40)
    WorldID = models.ForeignKey(World, on_delete=models.CASCADE)

class Session(models.Model):
    Description = models.CharField(max_length=255)
    RegionID = models.ForeignKey(Region, on_delete=models.CASCADE)
    SessionDate = models.DateTimeField()

class TownCryer(models.Model):
    SessionID = models.ForeignKey(Session, on_delete=models.CASCADE)
    Link = models.CharField(max_length=255)

class World(models.Model):
    Name = models.CharField(max_length=40)

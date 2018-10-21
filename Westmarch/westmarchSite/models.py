from django.db import models

# Create your models here.
class Character(models.Model):
    CharName = models.CharField(max_length=40)
    def __str__(self):
        return self.CharName

class CharacterSession(models.Model):
    CharacterID = models.ForeignKey(Character, on_delete=models.CASCADE)
    SessionID = models.ForeignKey("Session", on_delete=models.CASCADE)

class CharItem(models.Model):
    ItemID = models.ForeignKey("Item", on_delete=models.CASCADE)
    CharID = models.ForeignKey(Character, on_delete=models.CASCADE)

class City(models.Model):
    Name = models.CharField(max_length=40)
    RegionID = models.ForeignKey("Region", on_delete=models.CASCADE)
    def __str__(self):
        return self.Name

class CityItem(models.Model):
    CityID = models.ForeignKey(City, on_delete=models.CASCADE)
    ItemID = models.ForeignKey("Item", on_delete=models.CASCADE)

class GM(models.Model):
    Name = models.CharField(max_length=40)
    def __str__(self):
        return self.Name

class Item(models.Model):
    Name = models.CharField(max_length=40)
    Description = models.CharField(max_length=255)
    def __str__(self):
        return self.Name

class Player(models.Model):
    Name = models.CharField(max_length=40)
    def __str__(self):
        return self.Name

class Region(models.Model):
    Name = models.CharField(max_length=40)
    WorldID = models.ForeignKey("World", on_delete=models.CASCADE)
    def __str__(self):
        return self.Name

class Session(models.Model):
    Description = models.CharField(max_length=255)
    RegionID = models.ForeignKey(Region, on_delete=models.CASCADE)
    def __str__(self):
        return self.Description

class TownCrier(models.Model):
    SessionID = models.ForeignKey(Session, on_delete=models.CASCADE, verbose_name="Game name")
    Title = models.CharField(max_length=128)
    Description = models.TextField()
    PublishDate = models.DateTimeField()

    def __str__(self):
        return self.Title

class World(models.Model):
    Name = models.CharField(max_length=40)
    def __str__(self):
        return self.Name

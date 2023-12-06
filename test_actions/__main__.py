import os
from importlib.resources import files
from markupsafe import Markup

print(Markup('<b>%s</b>') % 'test this & that')

print(os.getcwd())
print(os.listdir())

path = files(__package__)

print([p.name for p in path.iterdir()])

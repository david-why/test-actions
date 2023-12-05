import os
from importlib.resources import files

print(os.getcwd())
print(os.listdir())

path = files(__package__)

print([p.name for p in path.iterdir()])

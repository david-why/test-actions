import os
from importlib.resources import files
from markupsafe import Markup
import dotenv
from redis.asyncio import from_url
from uvicorn.main import main
from quart import Quart
from aiofiles import open as aioopen

print(Markup('<b>%s</b>') % 'test this & that')

print(os.getcwd())
print(os.listdir())

path = files(__package__)

print([p.name for p in path.iterdir()])

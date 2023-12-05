import atexit
import os
import pkg_resources

print(os.getcwd())
print(os.listdir())

path = pkg_resources.resource_filename(__package__, 'static')

print(os.listdir(path))

atexit.register(pkg_resources.cleanup_resources)

curl -sSL https://install.python-poetry.org | python - -y
poetry init
poetry add pymacsign
cat > test_mac.py << eof
from pymacapp.buildtools.app import App
from pymacapp.buildtools.package import Package
import os

# CREDENTIALS
APPLE_DEVELOPER_EMAIL = 'david_why@outlook.com'
APPLE_DEVELOPER_TEAM_ID = ''
APPLE_APP_SPECIFIC_PASSWORD = 'placeholder'
APP_HASH = App.get_first_hash()
PKG_HASH = Package.get_first_hash()

## APP

# create the app wrapper
app = App("My New App")
app.config("/path/to/main.py").build().sign(APP_HASH)

## PACKAGE

# create the package wrapper
package = Package(app, identifier="foo.bar")
# explicit authentication required starting in v.4.0.1
package.login(APPLE_DEVELOPER_EMAIL, APPLE_APP_SPECIFIC_PASSWORD, APPLE_DEVELOPER_TEAM_ID)
# begin processing
package.build().sign(Package.get_first_hash()).notarize()
package.log_full_notary_log()
package.staple()
eof

python test_mac.py

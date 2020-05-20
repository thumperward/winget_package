name              'winget'
maintainer        'Chris Cunningham'
maintainer_email  'therealchriscunningham@outlook.com'
license           'Apache-2.0'
description       'Installs WinGet and adds a resource for WinGet packages'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.1'
supports          'windows'

source_url        'https://github.com/thumperward/winget'
issues_url        'https://github.com/thumperward/winget/issues'

chef_version      '>= 12.5'

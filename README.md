# winget

This cookbook installs [WinGet](https://github.com/microsoft/winget-cli) on a
Windows system and provides a custom resource for installing other packages
using WinGet.

## Requirements

-   Windows 10 build 1709 or later

## Usage

```ruby
include_recipe 'winget'

winget_package 'Install GIMP' do
  id 'gimp.gimp'
  name 'GNU Image Manipulation Program'
  action :install
end
```

### Actions

-   `:install`: installs the given application.

### Parameters

-   `id`: ID of the application to install. This must be an exact match.
    Defaults to the resource name.
-   `name`: the name the application uses in the Windows Programs applet. Used
    to check if the application is already installed. Defaults to the `id`.
-   `version`: the specific version to install. Defaults to the latest version.
-   `manifest`: if installing from a file rather than the Microsoft package
    repository, the path to the manifest of the application. Defaults to empty.
-   `override`: arguments to be passed on to the installer. Defaults to empty.
-   `location`: location to install to (if supported).

## TODO

-   Add full support for existing options
-   Add support for extra features (uninstall, update) as they are added to
    the upstream application

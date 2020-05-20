# winget

This cookbook installs [WinGet](https://github.com/microsoft/winget-cli) on a
Windows system and provides a custom resource for installing other packages
using it.

## Requirements

-   Windows 10 build 1709 or later

## Usage

```ruby
include_recipe 'winget'

winget_package 'Install GIMP' do
  id 'gimp.gimp'
  full_name 'GIMP 2.10.18'
  action :install
end
```

### Actions

-   `:install`: installs the given application.

### Parameters

-   `id`: ID of the application to install. This must be an exact match.
    Defaults to the resource name.
-   `full_name`: the name the application uses in the Windows Programs applet.
    Used to check if the application is already installed. Defaults to the
    `id`.
-   `version`: the specific version to install. Defaults to the latest version.
-   `manifest`: if installing from a file rather than the Microsoft package
    repository, the path to the manifest of the application. Defaults to unset.
-   `override`: arguments to be passed on to the installer. Defaults to unset.
-   `location`: location to install to (if supported). Defaults to unset.

## Notes and caveats

-   WinGet does not work correctly under WinRM and so Test Kitchen will fail
    when trying to install a resource. As a workaround, you can log onto the
    instance that was created and manually run `chef-zero` from the Test
    Kitchen cache to complete the run. This is an 
    [upstream bug](/microsoft/winget-cli/issues/256).

## TODO

-   Find and implement a workaround for the WinRM / UWP issue, or wait for this
    to be fixed in the upstream WinGet package.
-   Add full support for existing options.
-   Add support for extra features (uninstall, update) as they are added to
    the upstream application.

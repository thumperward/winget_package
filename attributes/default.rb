#
# Cookbook:: winget
# Attributes:: default
#
# Copyright:: 2020, Chris Cunningham
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['winget']['installer_url'] = 'https://github.com/microsoft/winget-cli/releases/download/v0.1.4331-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle'

default['winget']['vc_redist_url'] = case node['kernel']['machine']
  when 'i386'
    'https://aka.ms/vs/16/release/vc_redist.x86.exe'
  when 'x86_64'
    'https://aka.ms/vs/16/release/vc_redist.x64.exe'
  end

#
# Author:: Chris Cunningham (<therealchriscunningham@outlook.com>)
# Cookbook:: winget
# Recipe:: default
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

# winget is not installed by default, so we need to use a recipe to install it

unless platform_family?('windows')
  return "winget install not supported on #{node['platform_family']}"
end

remote_file "#{Chef::Config['file_cache_path']}/vc_redist.exe" do
  source node['winget']['vc_redist_url']
  action :nothing
end

execute 'Install Visual Studio DLLs' do
  cwd Chef::Config['file_cache_path']
  command 'VC_redist.exe /install /quiet'
  live_stream true
  notifies :create, "remote_file[#{Chef::Config['file_cache_path']}/vc_redist.exe]", :before
  not_if { ::File.exist?('C:/Windows/System32/vcruntime140_1.dll') }
end

remote_file "#{Chef::Config['file_cache_path']}/winget.appxbundle" do
  source node['winget']['installer_url']
  action :nothing
end

execute 'Install WinGet' do
  cwd Chef::Config['file_cache_path']
  command 'powershell -c Add-AppxPackage -Path ./winget.appxbundle'
  live_stream true
  notifies :create, "remote_file[#{Chef::Config['file_cache_path']}/winget.appxbundle]", :before
  # not_if { skip_install }
  not_if node['packages'].keys.include?('WinGet Source')
end

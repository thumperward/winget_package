#
# Author:: Chris Cunningham (<therealchriscunningham@outlook.com>)
# Cookbook:: winget
# Resource:: package
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

property :id, String, name_property: true
property :full_name, String
property :version, String
property :manifest, String
property :override, String
property :location, String

action :install do
  new_resource.full_name = new_resource.full_name ?
    new_resource.full_name :
    new_resource.id

  unless node['packages'].keys.include?(new_resource.full_name)
    execute "Install #{new_resource.full_name}" do
      command "winget install --id #{new_resource.id} --exact -h"
      live_stream true
    end
  end
end

#
# Author:: Chris Cunningham (<thumperward@hotmail.com>)
# Cookbook:: winget
# Resource:: package
#
# Copyright:: 2019, Chris Cunningham
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

# include Windows::Helper

property :id, String, name_property: true
property :name, String
property :version, String
property :manifest, String
property :override, String
property :location, String
# property :installed, [true, false], default: false, desired_state: false

# should be name, falling back to id
action :install do
  unless node['packages'].keys.include?(new_resource.id)
    execute "Install #{new_resource.id}" do
      command "winget install #{new_resource.id} --id --exact"
      live_stream true
    end
  end
end

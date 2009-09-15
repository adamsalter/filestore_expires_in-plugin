Filestore Cache Expires_in Plugin
============================

Adds a :expires_in option to Rails filestore caching, in line with memcached store. Providing a very easy way to add high capacity caching to a site.

Model observers and sweepers are still useable as well, of course.

Filestore caching is a much easier method of caching to implement quickly than memcached, since it just involves writing the cache data to files in the tmp/ directory (also making it good for shared hosting environments).

Installation
------

1) Install plugin

    ./script/plugin install git://github.com/adamsalter/filestore_expires_in-plugin.git

2) Enable :file_store caching

config/environments/production.rb:

    config.action_controller.perform_caching = true
    config.cache_store = :file_store, "#{RAILS_ROOT}/tmp/cache"

Useage
------

On controller classes:

    class MyController < ApplicationController
      caches_action :show, {:if => etc.}, {:expires_in => 1.day}
    end

In controller methods:

    unless read_fragment({:controller => 'mycontroller', etc.}, {:expires_in => 1.day})
      #code here
    end

In views:

    cache({:controller => 'mycontroller', etc.}, {:expires_in => 1.day}) do
      #fragment here
    end

In models:

    cache_key = "models/my_model/%s?%s-%s-%s" % ["model_method_name", self.value, page, limit]
    
    result = Rails.cache.fetch(cache_key, :expires_in => 1.day) do
      # result data to be cached
    end


Copyright (c) 2009 Adam @ [Codebright.net][cb], released under the MIT license

[cb]:http://codebright.net
Filestore Cache Expire_in Plugin
============================

Adds a :expire_in option to Rails filestore caching, in line with memcache store.

Example
=======

To enable :file_store caching:

    #config/environments/production.rb
    config.action_controller.perform_caching             = true
    config.cache_store = :file_store, "#{RAILS_ROOT}/tmp/cache"


In views:

    cache({:controller => 'mycontroller', etc.}, {:expire_in => 1.day}) do
      #fragment here
    end

In controllers:

    unless read_fragment({:controller => 'mycontroller', etc.}, {:expire_in => 1.day})
      #code here
    end


Copyright (c) 2009 Adam @ [Codebright.net][cb], released under the MIT license

[cb]:http://codebright.net
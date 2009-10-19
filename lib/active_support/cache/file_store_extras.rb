
module ActiveSupport
  module Cache
    class FileStore < Store
      alias :original_read :read
      
      def read(name, options = {})
        lastmod = File.mtime(real_file_path(name)) rescue nil
        if lastmod && options.is_a?(Hash) && options[:expires_in] && ((lastmod + options[:expires_in]) <= Time.now)
          nil
        else  
          original_read(name, options)
        end
      end
    end
  end    
end
require 'json'
require 'rack'
require 'byebug'
module Now
    def [](key)
        return key
    end
    def []=(key, value)
        return value
    end
end

class Flash


    def initialize(req)
        cookie = req.cookies["_rails_lite_app_flash"]
        @@test
        if cookie
          @flash = JSON.parse(cookie)
        elsif 
          @flash = {}
        end

        @flash.each do |k,v|
          @flash[k] = flash_helper(v)
        end
        
    end

    def [](key)
      if @flash.has_key?(key.to_s)
        return @flash[key.to_s][:value]
      end

      nil
    end

    def []=(key, val)
      @flash[key] = flash_helper(val, true)
    end
    
    def store_flash(res)
      results = {}
      @flash.each do |k,v|
        if v[:persist]
          results[k] = v[:value]
        end
      end
      cookie = {
      path: "/",
      value: results.to_json
      }
      res.set_cookie("_rails_lite_app_flash", cookie)
    end
    
    
    def flash_helper(value, persist = false)
      { value: value, persist: persist }
    end
    
    include FlashNow
    def now
        
        FlashNow.new
    end
    def now=(key,value)
        puts "some set value"
    end
end

module FlashNow < Flash
    def now
        @now = {}
    end

    def []
    end

    def []=
    end
end
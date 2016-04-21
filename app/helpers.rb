module SinatraBabies
  module Controllers
    class Base
      module Helpers
        
        def has_error?(obj, field)
          if obj.respond_to? "errors"
            unless obj.errors[field].empty?
              "has-error"
            end
          end
        end

        def has_content?(obj, field)
          obj.send(field) if obj
        end

      end
    end
  end
end

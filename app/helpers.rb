module SinatraBabies
  module Controllers
    class Base
      module Helpers
        
        def has_error?(field)
          if flash[:errors]
            "has-error" if flash[:errors].has_key? field
          end
        end

      end
    end
  end
end

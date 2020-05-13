module Nuts
  module Docs
    module ErbToMd
      class Context < OpenStruct
        def get_binding
          binding
        end
      end
    end
  end
end

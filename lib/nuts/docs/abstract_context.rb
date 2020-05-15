module Nuts
  module Docs
    class AbstractContext < OpenStruct
      def get_binding
        binding
      end
    end
  end
end

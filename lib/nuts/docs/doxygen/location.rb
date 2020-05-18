module Nuts
  module Docs
    module Doxygen
      class Location < CompoundBase
        key :file, :attribute
        key :line, :attribute
        key :column, :attribute
      end
    end
  end
end

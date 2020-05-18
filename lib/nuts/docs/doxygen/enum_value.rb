module Nuts
  module Docs
    module Doxygen
      class EnumValue < CompoundBase
        key :id, :attribute
        key :name, :text
        key :briefdescription, :text
        key :detaileddescription, :text
      end
    end
  end
end

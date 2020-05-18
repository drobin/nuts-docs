module Nuts
  module Docs
    module Doxygen
      class Enum < CompoundBase
        include Typedef

        key :id, :attribute
        key :type, :text
        key :name, :text
        key :briefdescription, :text
        key :detaileddescription, :text
        key :inbodydescription, :text
        key :location, :child, klass: Location, singleton: true
        key :enumvalue, :child, klass: EnumValue
      end
    end
  end
end

module Nuts
  module Docs
    module Doxygen
      class Member < CompoundBase
        key :id, :attribute
        key :type, :text
        key :definition, :text
        key :name, :text
        key :briefdescription, :text
        key :detaileddescription, :text
        key :inbodydescription, :text
        key :location, :child, klass: Location, singleton: true
      end
    end
  end
end

module Nuts
  module Docs
    module Doxygen
      class Function < CompoundBase
        key :id, :attribute
        key :type, :text
        key :definition, :text
        key :argsstring, :text
        key :name, :text
        key :briefdescription, :text
        key :detaileddescription, :text
        key :inbodydescription, :text
        key :location, :child, klass: Location, singleton: true
        key :param, :child, klass: Param
      end
    end
  end
end

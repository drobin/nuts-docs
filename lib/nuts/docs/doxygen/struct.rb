module Nuts
  module Docs
    module Doxygen
      class Struct < CompoundBase
        include Typedef

        key :id, :attribute
        key :name, :text, name: :compoundname
        key :briefdescription, :text
        key :detaileddescription, :text
        key :member, :child, klass: Member, name: "sectiondef/memberdef"
      end
    end
  end
end

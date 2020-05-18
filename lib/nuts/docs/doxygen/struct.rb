module Nuts
  module Docs
    module Doxygen
      class Struct < CompoundBase
        key :id, :attribute
        key :name, :text, name: :compoundname
        key :briefdescription, :text
        key :detaileddescription, :text
        key :member, :child, klass: Member, name: "sectiondef/memberdef"

        def typedef?
          [ "nuts_getopts_state" ].include?(name)
        end
      end
    end
  end
end

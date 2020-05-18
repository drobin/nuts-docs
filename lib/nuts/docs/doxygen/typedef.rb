module Nuts
  module Docs
    module Doxygen
      module Typedef
        def typedef?
          root = @elem&.document&.root
          return false if root.nil?

          typedefs = root["nuts-docs-typedefs"]&.split(",") || []
          typedefs.include?(name)
        end
      end
    end
  end
end

require "erb"
require "ostruct"
require "nokogiri"

require "nuts/docs/version"
require "nuts/docs/abstract_context"
require "nuts/docs/general_context"
require "nuts/docs/doxygen_context"
require "nuts/docs/runner"
require "nuts/docs/doxygen/compound_base"
require "nuts/docs/doxygen/typedef"
require "nuts/docs/doxygen/enum_value"
require "nuts/docs/doxygen/location"
require "nuts/docs/doxygen/enum"
require "nuts/docs/doxygen/param"
require "nuts/docs/doxygen/function"
require "nuts/docs/doxygen/member"
require "nuts/docs/doxygen/struct"

module Nuts
  module Docs
    class Error < StandardError; end
    # Your code goes here...
  end
end

require "erb"
require "ostruct"
require "nokogiri"

require "nuts/docs/version"
require "nuts/docs/abstract_context"
require "nuts/docs/general_context"
require "nuts/docs/runner"
require "nuts/docs/xml_to_md/compound_base"
require "nuts/docs/xml_to_md/compounds"
require "nuts/docs/xml_to_md/context"
require "nuts/docs/xml_to_md/runner"

module Nuts
  module Docs
    class Error < StandardError; end
    # Your code goes here...
  end
end

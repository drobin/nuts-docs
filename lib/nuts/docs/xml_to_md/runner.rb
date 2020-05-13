module Nuts
  module Docs
    module XmlToMd
      class Runner
        def initialize(doxygen_xml_path, group)
          @doxygen_xml_path = doxygen_xml_path
          @group = group
        end

        def context
          return @context if @context

          xml_source = File.join(@doxygen_xml_path, "group__#{@group}.xml")
          @context ||= Context.new(xml_source)
        end

        def run(str)
          template = ERB.new(str, nil, "<>")
          template.result(context.get_binding)
        end
      end
    end
  end
end

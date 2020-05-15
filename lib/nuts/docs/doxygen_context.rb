module Nuts
  module Docs
    class DoxygenContext < AbstractContext
      def initialize(build_path, group)
        super()

        @build_path = build_path
        @group = group
      end

      def select(type)
        send("select_#{type}")
      end

      private

      def doc
        if @doc.nil?
          path = File.join(@build_path, "group__#{@group}.xml")
          @doc ||= File.open(path) { |f| Nokogiri::XML(f) }
        end

        return @doc
      end

      def select_functions
        doc.xpath("/doxygen/compounddef/sectiondef[@kind='func']/memberdef").map do |memberdef|
          Doxygen::Function.new(memberdef)
        end
      end

      def select_enums
        doc.xpath("/doxygen/compounddef/sectiondef[@kind='enum']/memberdef").map do |memberdef|
          Doxygen::Enum.new(memberdef)
        end
      end

      def select_structs
        doc.xpath("/doxygen/compounddef/innerclass").map do |innerclass|
          innerpath = File.join(@build_path, "#{innerclass["refid"]}.xml")
          innerdoc = File.open(innerpath) { |f| Nokogiri::XML(f) }
          compounddef = innerdoc.xpath("/doxygen/compounddef")
          Doxygen::Struct.new(compounddef.first)
        end
      end
    end
  end
end

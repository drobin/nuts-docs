module Nuts
  module Docs
    class DoxygenContext < AbstractContext
      def initialize(build_path, header)
        super()

        @build_path = build_path
        @header = header
      end

      def typedefs
        @typedefs || []
      end

      def typedefs=(list)
        @typedefs = list
      end

      def select(type)
        send("select_#{type}")
      end

      private

      def doc
        if @doc.nil?
          compound = index_doc.xpath("/doxygenindex/compound[@kind='file'][name='#{@header}']").first
          path = File.join(@build_path, "#{compound['refid']}.xml")
          @doc = File.open(path) { |f| Nokogiri::XML(f) }
          inject_typedefs(@doc)
        end

        return @doc
      end

      def index_doc
        if @index_doc.nil?
          path = File.join(@build_path, "index.xml")
          @index_doc ||= File.open(path) { |f| Nokogiri::XML(f) }
        end

        @index_doc
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
          inject_typedefs(innerdoc)
          compounddef = innerdoc.xpath("/doxygen/compounddef")
          Doxygen::Struct.new(compounddef.first)
        end
      end

      def inject_typedefs(doc)
        if doc.root
          doc.root["nuts-docs-typedefs"] = typedefs.join(",")
        end
      end
    end
  end
end

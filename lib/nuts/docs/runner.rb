module Nuts
  module Docs
    class Runner
      attr_accessor :context

      def run(str)
        template = ERB.new(str, nil, "<>")
        template.result(context.get_binding)
      end
    end
  end
end

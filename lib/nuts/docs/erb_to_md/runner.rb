module Nuts
  module Docs
    module ErbToMd
      class Runner
        def context
          @context ||= Context.new
        end

        def run(str)
          template = ERB.new(str, nil, "<>")
          template.result(context.get_binding)
        end
      end
    end
  end
end

require 'liquid'

module Epubber::Services
  class Template
    # Compiles and renderes a template file in the given context
    def parse(file:, context:)
      compile(file).render context
    end

    # Compiles a file and returns a template instance ready to be rendered
    def compile(file)
      Liquid::Template.parse load(file)
    end

    # Returns the full path for a given template file
    def path(file)
      File.join File.dirname(__FILE__), '../../templates/', file
    end

  protected

    # Opens a file from disk located inside ./templates
    def load(file)
      File.open(path(file)).read
    end
  end
end

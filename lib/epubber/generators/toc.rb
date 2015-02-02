require 'epubber/generators/generator'

module Epubber::Generators
  class Toc < Epubber::Generators::Generator
    def generate
      content = template.parse file: 'OEBPS/toc.ncx', context: book_context
      persist file: 'OEBPS/toc.ncx', content: content

      content = template.parse file: 'OEBPS/Text/toc.xhtml', context: book_context
      persist file: 'OEBPS/Text/toc.xhtml', content: content
    end
  end
end

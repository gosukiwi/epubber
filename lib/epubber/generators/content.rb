require 'epubber/generators/generator'

module Epubber::Generators
  class Content < Generator
    def generate
      content = template.parse file: 'OEBPS/content.opf', context: book_context
      persist file: 'OEBPS/content.opf', content: content
    end
  end
end

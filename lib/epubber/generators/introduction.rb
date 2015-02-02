require 'epubber/generators/generator'

module Epubber::Generators
  class Introduction < Generator
    def generate
      # Because this is an optional generator, don't do anything if there's no
      # introduction in the book
      return if book.introduction.nil?

      content = template.parse file: 'OEBPS/Text/introduction.xhtml', context: book_context
      persist file: 'OEBPS/Text/introduction.xhtml', content: content
    end
  end
end

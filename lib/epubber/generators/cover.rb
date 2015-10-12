require 'epubber/generators/generator'

module Epubber::Generators
  class Cover < Generator
    def generate
      # Because this is an optional generator, don't do anything if there's no
      # introduction in the book
      return if book.cover.nil?

      content = template.parse file: 'OEBPS/Text/cover.xhtml', context: book_context
      persist file: 'OEBPS/Text/cover.xhtml', content: content
      persist file: "OEBPS/Images/#{book_context['book']['cover']['filename']}", content: book_context['book']['cover']['file']
    end
  end
end

require 'epubber/generators/generator'

module Epubber::Generators
  class Endnotes < Generator
    def generate
      # Because this is an optional generator, don't do anything if there's no
      # introduction in the book
      return if book.endnotes.nil?

      content = template.parse file: 'OEBPS/Text/endnotes.xhtml', context: book_context
      persist file: 'OEBPS/Text/endnotes.xhtml', content: content
    end
  end
end

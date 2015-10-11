require 'epubber/services/template'

module Epubber::Generators
  class Generator
    attr_reader :book, :persistance
    def initialize(book:, persistance:)
      @book = book
      @persistance = persistance
    end

  protected

    def book_context
      { 'book' => book.contextify }
    end

    def template
      Epubber::Services::Template.new
    end

    def template_path(file)
      template.path file
    end

    def persist(file:, content:)
      persistance.persist file: file, content: content
    end
  end
end

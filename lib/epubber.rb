require "epubber/version"
require "epubber/models/book"
require "epubber/generator"

module Epubber
  def self.generate(filename: filename = nil, working_dir: working_dir = nil)
    book = Epubber::Models::Book.new
    yield book
    generator = Epubber::Generator.new book: book, working_dir: working_dir, filename: filename
    generator.generate
  end
end

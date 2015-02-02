require 'epubber/generators/chapters'
require 'epubber/generators/content'
require 'epubber/generators/toc'
require 'epubber/generators/introduction'
require 'epubber/generators/static'
require 'epubber/services/persistance'
require 'epubber/services/compressor'

# Given a book and a place to work in, generates all required EPUB files
class Epubber::Generator
  attr_reader :working_dir, :book, :filename
  def initialize(book: book, filename: filename, working_dir: working_dir)
    @book        = book
    @filename    = filename || "#{book.title}.epub"
    @working_dir = working_dir || 'C:/tmp/epubber'
    @persistance = Epubber::Services::Persistance.new @working_dir
    @generators  = []

    params = { book: book, persistance: @persistance }
    add_generator Epubber::Generators::Content.new(params)
    add_generator Epubber::Generators::Introduction.new(params)
    add_generator Epubber::Generators::Toc.new(params)
    add_generator Epubber::Generators::Chapters.new(params)
    add_generator Epubber::Generators::Static.new(params)
  end

  def generate
    @generators.each { |generator| generator.generate }
    pack
  end

protected

  def clean_working_dir
    @persistance.clean
  end

  def compressor
    Epubber::Services::Compressor.new
  end

  def compress(dir, file)
    compressor.compress dir, file
  end

  def pack
    path = File.join working_dir, "/../#{filename}"
    compress working_dir, path
    clean_working_dir
    path
  end

  def add_generator(generator)
    @generators << generator
  end
end

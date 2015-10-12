require 'epubber/generators/chapters'
require 'epubber/generators/content'
require 'epubber/generators/toc'
require 'epubber/generators/introduction'
require 'epubber/generators/static'
require 'epubber/generators/endnotes'
require 'epubber/generators/cover'
require 'epubber/services/persistance'
require 'epubber/services/compressor'

# Given a book and a place to work in, generates all required EPUB files
class Epubber::Generator
  attr_reader :working_dir, :book, :filename
  def initialize(book:, filename:, working_dir:)
    @book        = book
    @filename    = filename || "#{book.title}.epub"
    @working_dir = working_dir || '/tmp/epubber'
    @persistance = Epubber::Services::Persistance.new File.join(@working_dir, 'workspace')
    @generators  = []

    register_generators book: book, persistance: @persistance
  end

  def register_generators(params)
    add_generator Epubber::Generators::Content.new(params)
    add_generator Epubber::Generators::Cover.new(params)
    add_generator Epubber::Generators::Introduction.new(params)
    add_generator Epubber::Generators::Toc.new(params)
    add_generator Epubber::Generators::Chapters.new(params)
    add_generator Epubber::Generators::Endnotes.new(params)
    add_generator Epubber::Generators::Static.new(params)
  end

  def generate
    @generators.each { |generator| generator.generate }
    pack
  end

protected

  def clean_tmp
    @persistance.clean
  end

  def compressor
    Epubber::Services::Compressor.new
  end

  def compress
    file = File.join working_dir, "#{filename}"
    dir  = File.join working_dir, 'workspace'
    compressor.compress dir, file
    return file
  end

  def pack
    path = compress
    clean_tmp
    return path
  end

  def add_generator(generator)
    @generators << generator
  end
end

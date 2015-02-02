require 'securerandom'
require 'epubber/models/chapter'
require 'epubber/models/introduction'

# Represents a book with it's chapters.
module Epubber::Models
  class Book
    attr_reader :chapters, :introduction
    def initialize
      @title        = not_specified
      @author       = not_specified
      @description  = not_specified
      @publisher    = not_specified
      @language     = 'en'
      @url          = not_specified
      # LIST / OF / SUBJECTS => https://www.bisg.org/complete-bisac-subject-headings-2014-edition
      @subjects     = 'NON000000 NON-CLASSIFIABLE'
      @isbn         = nil

      # Related models
      @chapters = []
      @introduction = nil
    end

    def introduction(&block)
      return @introduction unless block_given?
      @introduction = Introduction.new
      @introduction.instance_eval &block
    end

    # Add new chapter to the book
    def chapter(&block)
      chapter = Chapter.new
      chapter.instance_eval &block
      chapter.id(chapters.count + 1)
      chapters << chapter
    end

    def title(text = nil)
      return @title if text.nil?
      @title = text
    end

    def author(text)
      @author = text
    end

    def publisher(text)
      @publisher = text
    end

    def description(text)
      @description = text
    end

    def language(lang)
      @language = lang
    end

    def url(url)
      @url = url
    end

    def subjects(subjects)
      @subjects = subjects
    end

    def isbn(isbn)
      @isbn = isbn
    end

    def contextify
      { 
        # Attributes
        "title" => @title, 
        "author" => @author,
        "description" => @description, 
        "publisher" => @publisher,
        "language" => @language,
        "url" => @url,
        "subjects" => @subjects,
        "uuid" => ::SecureRandom.uuid,
        "isbn" => @isbn,
        # Related models
        "chapters" => contextified_chapters,
        "introduction" => @introduction.contextify
      }
    end

  protected

    def not_specified
      'Not specified'
    end

    def contextified_chapters
      chapters.map do |chapter|
        chapter.contextify
      end
    end
  end
end

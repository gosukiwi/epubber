require 'securerandom'
require 'epubber/models/concerns/has_chapters'
require 'epubber/models/concerns/has_introduction'

# Represents a book with it's chapters.
module Epubber::Models
  class Book
    # Related models and their DSL goodies
    include Epubber::Models::Concerns::HasChapters
    include Epubber::Models::Concerns::HasIntroduction

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

    # Return a hash which can be used as a template's context
    def contextify
      context = { 
        # Attributes
        "title" => @title, 
        "author" => @author,
        "description" => @description, 
        "publisher" => @publisher,
        "language" => @language,
        "url" => @url,
        "subjects" => @subjects,
        "uuid" => ::SecureRandom.uuid,
        "isbn" => @isbn
      }
      
      # Related models
      context["chapters"]     = contextified_chapters
      context["introduction"] = contextified_introduction
      return context
    end

  protected

    def not_specified
      'Not specified'
    end
  end
end

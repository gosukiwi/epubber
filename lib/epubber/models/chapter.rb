require 'epubber/models/concerns/has_endnotes'

# Represents a book's chapter
module Epubber::Models
  class Chapter
    include Epubber::Models::Concerns::HasHTML

    def initialize
      @id = 0
      @title = 'Not specified'
      @content = '<p>Not specified</p>'
    end

    def id(idx)
      @id = idx
    end

    def title(text)
      @title = text
    end

    def content(text)
      @content = clean_html(text)
    end

    def contextify
      { 'id' => @id, 'title' => @title, 'content' => @content }
    end
  end
end

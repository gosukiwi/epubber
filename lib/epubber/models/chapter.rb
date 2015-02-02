# Represents a book's chapter
module Epubber::Models
  class Chapter
    def initialize
      @id = 0
      @title = 'No Title'
      @content = '<p>No content</p>'
    end

    def id(idx)
      @id = idx
    end

    def title(text)
      @title = text
    end

    def content(text)
      @content = text
    end

    def contextify
      { 'id' => @id, 'title' => @title, 'content' => @content }
    end
  end
end

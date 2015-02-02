# Represents a book's introduction
module Epubber::Models
  class Introduction
    def initialize
      @content = '<p>Not specified</p>'
    end

    def content(content)
      @content = content
    end

    def contextify
      { 'content' => @content }
    end
  end
end

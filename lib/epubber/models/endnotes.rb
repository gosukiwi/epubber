require 'epubber/models/model'

# Represents a book's introduction
module Epubber::Models
  class Endnotes < Model
    def initialize
      @content = '<p>Not specified</p>'
    end

    def content(content)
      @content = clean_html(content)
    end

    def contextify
      { 'content' => @content }
    end
  end
end

require 'epubber/models/chapter'

module Epubber::Models::Concerns
  module HasChapters
    def chapters
      @chapters ||= []
    end

    # Add chapter
    def chapter(&block)
      chapter = Epubber::Models::Chapter.new
      chapter.instance_eval &block
      chapter.id(chapters.count + 1)
      chapters << chapter
    end

    def contextified_chapters
      chapters.map do |chapter|
        chapter.contextify
      end
    end
  end
end

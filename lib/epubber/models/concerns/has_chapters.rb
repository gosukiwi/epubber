require 'epubber/models/chapter'

module Epubber::Models
  module Concerns
    module HasChapters
      def chapters
        @chapters ||= []
      end

      # Add chapter
      def chapter
        raise 'No block given' unless block_given?
        chapter = Epubber::Models::Chapter.new
        yield chapter
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
end

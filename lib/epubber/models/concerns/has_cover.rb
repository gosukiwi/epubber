require 'epubber/models/cover'

module Epubber::Models
  module Concerns
    module HasCover
      def cover(&block)
        @cover ||= nil
        return @cover unless block_given?
        @cover = Epubber::Models::Cover.new
        yield @cover
      end

      def contextified_cover
        return nil if cover.nil?
        return cover.contextify
      end
    end
  end
end

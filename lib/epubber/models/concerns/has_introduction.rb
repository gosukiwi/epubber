require 'epubber/models/introduction'

module Epubber::Models
  module Concerns
    module HasIntroduction
      def introduction(&block)
        @introduction ||= nil
        return @introduction unless block_given?
        @introduction = Epubber::Models::Introduction.new
        yield @introduction
      end

      def contextified_introduction
        return nil if introduction.nil?
        return introduction.contextify
      end
    end
  end
end

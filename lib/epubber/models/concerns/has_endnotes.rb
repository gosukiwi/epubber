require 'epubber/models/endnotes'

module Epubber::Models
  module Concerns
    module HasEndnotes
      def endnotes
        @endnotes ||= nil
        return @endnotes unless block_given?
        @endnotes = Epubber::Models::Endnotes.new
        yield @endnotes
      end

      def contextified_endnotes
        return nil if endnotes.nil?
        return endnotes.contextify
      end
    end
  end
end

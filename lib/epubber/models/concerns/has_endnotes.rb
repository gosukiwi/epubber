require 'epubber/models/endnotes'

module Epubber::Models::Concerns
  module HasEndnotes
    def endnotes(&block)
      @endnotes ||= nil
      return @endnotes unless block_given?
      @endnotes = Epubber::Models::Endnotes.new
      @endnotes.instance_eval &block
    end

    def contextified_endnotes
      return nil if endnotes.nil?
      return endnotes.contextify
    end
  end
end

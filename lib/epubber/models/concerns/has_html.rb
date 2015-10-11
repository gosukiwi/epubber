require 'epubber/models/chapter'
require 'nokogiri'

module Epubber::Models::Concerns
  module HasHTML
    def clean_html(html)
      Nokogiri::XML::DocumentFragment.parse(html).to_s
    end
  end
end

require 'nokogiri'

module Epubber::Models
  module Concerns
    module HasHTML
      def clean_html(html)
        Nokogiri::HTML::DocumentFragment.parse(html).to_xhtml
      end
    end
  end
end

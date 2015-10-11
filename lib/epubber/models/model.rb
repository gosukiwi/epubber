require 'nokogiri'

module Epubber::Models
  class Model
    # Because the EPUB format always uses XHTML, let's make sure things like
    # `<br>` gets transformed to `<br />`.
    def clean_html(html)
      Nokogiri::HTML::DocumentFragment.parse(html).to_xhtml
    end
  end
end

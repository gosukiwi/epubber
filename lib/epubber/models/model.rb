require 'nokogiri'

module Epubber::Models
  class Model
    # Because the EPUB format always uses XHTML, let's make sure things like
    # `<br>` gets transformed to `<br />`.
    def clean_html(html)
      Nokogiri::XML::DocumentFragment.parse(html).to_s
    end
  end
end

require 'minitest/autorun'
require 'epubber'

class EpubberTest < Minitest::Test
  def test_dsl
    result = Epubber.generate do
      title 'My First EPUB book'
      author 'Ramirez, Federico'

      chapter do
        title 'Chapter 1'
        content '<p>This is some content!</p>'
      end

      chapter do
        title 'Chapter 2'
        content '<p>Some more content this is.</p>'
      end
    end

    puts result
  end
end

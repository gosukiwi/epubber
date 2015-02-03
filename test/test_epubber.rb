require 'minitest/autorun'
require 'epubber'

class EpubberTest < Minitest::Test
  def test_dsl
    result = Epubber.generate do
      title 'My First EPUB book'
      author 'Ramirez, Federico'

      introduction do
        content "<p>This is the introduction, and it's optional. What is this book about?</p>"
      end

      chapter do
        title 'Chapter 1'
        content '<p>This is some content!</p>'
      end

      chapter do
        title 'Chapter 2'
        content '<p>Some more content this is.</p>'
      end

      endnotes do
        content '<p>This was a fun book. Thanks for reading!</p>'
      end
    end

    puts result
  end
end

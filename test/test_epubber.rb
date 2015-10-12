require 'minitest/autorun'
require 'pry-byebug'
require 'epubber'

class EpubberTest < Minitest::Test
  def test_dsl
    result = Epubber.generate do |b|
      b.title 'My First EPUB book'
      b.author 'Ramirez, Federico'

      b.cover do |c|
        c.file File.new("#{File.dirname(__FILE__)}/assets/test-cover.png")
      end

      b.introduction do |i|
        i.content "<p>This is the introduction, and it's optional. What is this book about?</p>"
      end

      b.chapter do |c|
        c.title 'Chapter 1'
        c.content '<p>This is some content!</p>'
      end

      b.chapter do |c|
        c.title 'Chapter 2'
        c.content '<p>Some more content this is.</p>'
      end

      b.endnotes do |e|
        e.content '<p>This was a fun book. Thanks for reading!</p>'
      end
    end

    assert_equal '/tmp/epubber/My First EPUB book.epub', result
  end
end

require 'epubber/generators/generator'

module Epubber::Generators
  class Chapters < Generator
    def generate
      compiled_template = template.compile 'OEBPS/Text/chapter.xhtml'
      book.chapters.each do |chapter|
        generate_chapter compiled_template, chapter
      end
    end

  protected
    
    def generate_chapter(compiled_template, chapter)
      context = chapter.contextify
      content = compiled_template.render context
      persist file: "OEBPS/Text/chapter#{context['id']}.xhtml", content: content
    end
  end
end

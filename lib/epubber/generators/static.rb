require 'epubber/generators/generator'

module Epubber::Generators
  class Static < Epubber::Generators::Generator
    def generate
      files = ['mimetype', 'META-INF/container.xml', 'META-INF/com.apple.ibooks.display-options.xml',
               'OEBPS/Text/acknowledgements.xhtml', 'OEBPS/Text/cover.xhtml', 'OEBPS/Text/dedication.xhtml', 'OEBPS/Text/endnotes.xhtml',
               'OEBPS/Text/foreword.xhtml', 'OEBPS/Text/frontmatter.xhtml', 'OEBPS/Text/introduction.xhtml', 'OEBPS/Styles/style.css']
      files.each do |file|
        copy file
      end
    end

  protected

    # Get the file from the template and copy it unchanged
    def copy(file)
      content = File.open(template_path(file)).read
      persist file: file, content: content
    end
  end
end

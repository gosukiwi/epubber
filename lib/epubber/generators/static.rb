require 'epubber/generators/generator'

module Epubber::Generators
  class Static < Generator
    def generate
      files = ['mimetype', 'META-INF/container.xml', 'META-INF/com.apple.ibooks.display-options.xml',
               'OEBPS/Text/cover.xhtml', 'OEBPS/Styles/style.css']
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

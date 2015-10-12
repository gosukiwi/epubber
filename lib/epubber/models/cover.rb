# Represents a book's introduction
module Epubber::Models
  class Cover
    def initialize
      @file = nil
    end

    def file(image = nil)
      if image
        @file = image
      else
        @file
      end
    end

    def filename
      File.basename(@file.path)
    end

    def file_mime
      if /(?:jpg|jpeg)/ =~ filename
        'image/jpeg'
      elsif /(?:png)/ =~ filename
        'image/png'
      else
        raise 'Invalid file type: Only JPG and PNG images are allowed.'
      end
    end

    def contextify
      { 'filename' => filename, 'file' => file, 'file_mime' => file_mime }
    end
  end
end

module Epubber::Services
  class Persistance
    attr_reader :working_dir
    def initialize(working_dir)
      @working_dir = working_dir
    end

    # Persist a file into the working directory with the spcified contents.
    # The file argument is the relative path to the new file, eg: test/chapters/file.xhtml
    def persist(file: file, content: content)
      create_path_for file
      write file, content
    end

    # Remove the working directory, thus cleaning the file system
    def clean
      FileUtils.remove_dir working_dir, true
    end

  protected

    def write(file, content)
      File.write path(file), content
    end

    def create_path_for(file)
      dir = File.dirname path(file)
      FileUtils.mkdir_p dir unless File.directory?(dir)
    end

    def path(file)
      File.join working_dir, file
    end
  end
end

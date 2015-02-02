require 'zip'

module Epubber::Services
  class Compressor
    def compress(dir, file)
      FileUtils.rm file if File.exists?(file)
      generator = ZipFileGenerator.new dir, file
      generator.write
    end
  end

  # Helper class to create the actual zip file
  class ZipFileGenerator
    # Initialize with the directory to zip and the location of the output archive.
    def initialize(inputDir, outputFile)
      @inputDir   = inputDir
      @outputFile = outputFile
    end

    # Zip the input directory.
    def write()
      entries = Dir.entries(@inputDir); entries.delete("."); entries.delete("..")
      io = Zip::File.open(@outputFile, Zip::File::CREATE);

      writeEntries(entries, "", io)
      io.close();
    end

  private

    def writeEntries(entries, path, io)
      entries.each { |e|
        zipFilePath = path == "" ? e : File.join(path, e)
        diskFilePath = File.join(@inputDir, zipFilePath)
        puts "Deflating " + diskFilePath
        if  File.directory?(diskFilePath)
          io.mkdir(zipFilePath)
          subdir =Dir.entries(diskFilePath); subdir.delete("."); subdir.delete("..")
          writeEntries(subdir, zipFilePath, io)
        else
          io.get_output_stream(zipFilePath) { |f| f.puts(File.open(diskFilePath, "rb").read())}
        end
      }
    end
  end
end

# encoding: UTF-8

class Syscomex::Parser

  attr_accessor :content

  def initialize(file_path)
    @file = File.open(file_path, 'r:ISO-8859-1')
    @file.rewind
    @content = enforce_proper_encoding(@file.read)
  end

  private

  def enforce_proper_encoding(string)
    if string.encoding.name == "UTF-8"
      string
    else
      string.encode(Encoding::UTF_8, Encoding::ISO_8859_1)
    end
  end

end

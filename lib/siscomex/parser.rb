# encoding: UTF-8

class Siscomex::Parser

  attr_accessor :content

  def initialize(file_path)
    @file = File.open(file_path, 'r:ISO-8859-1')
    @file.rewind
    @content = @file.read
  end

end

# encoding: UTF-8

require "date"

class Siscomex::RowParser

  def initialize(row, extraction_details)
    @row = enforce_proper_encoding(row)
    @extraction_details = extraction_details
  end

  def type
    @extraction_details[0]
  end

  def offset
    @extraction_details[1]
  end

  def bytesize
    @row.bytesize
  end

  def extract
    send "extract_#{type}"
  end

private

  def slice_by_offset
    extracted = (@row.byteslice(0, offset)).strip
    rest      = @row.byteslice(offset, bytesize)

    return extracted, rest
  end

  def extract_text
    extracted, rest = slice_by_offset

    return extracted.to_s, rest
  end

  def extract_numeric
    extracted, rest = slice_by_offset

    return extracted.to_i, rest
  end

  def extract_boolean
    extracted, rest = slice_by_offset

    return (extracted == "S"), rest
  end

  def extract_date
    extracted, rest = slice_by_offset
    return Date.parse(extracted), rest
  end

  def enforce_proper_encoding(string)
    if string.encoding.name == "UTF-8"
      string.encode Encoding::UTF_8, Encoding::UTF_8, invalid: :replace, replace: ''
    else
      string.encode Encoding::UTF_8, Encoding::ISO_8859_1
    end
  end

end
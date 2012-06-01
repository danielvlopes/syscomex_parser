class Syscomex::Visit

  attr_accessor :attributes, :row

  def initialize(row)
    @attributes = {}
    @row = row

    extract_type_and_line_ending_from_row!
    extract_attributes_from_row
  end

private

  def extract_type_and_line_ending_from_row!
    @row = @row[1..-2]
  end

  def extract_attributes_from_row
    current_position = 0
    temp_row = @row

    Syscomex::Layouts::VISIT.each do |attribute, type|
      row_parser = Syscomex::RowParser.new(temp_row, type)
      extraction, temp_row = row_parser.extract
      attributes[attribute.to_sym] = extraction
    end
  end

end

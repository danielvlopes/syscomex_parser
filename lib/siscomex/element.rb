class Siscomex::Element

  attr_accessor :attributes, :row

  def initialize(row)
    @attributes = {}
    @row = row

    extract_type_and_line_ending_from_row!
    extract_attributes_from_row
  end

private

  def self.layout
    raise "You must implement the layout method on subclasses"
  end

  def extract_type_and_line_ending_from_row!
    @row = @row[1..-2]
  end

  def extract_attributes_from_row
    current_position = 0
    temp_row = @row

    self.class.layout.each do |attribute, value|
      extraction, temp_row = Siscomex::RowParser.new(temp_row, value).extract
      attributes[attribute.to_sym] = extraction
    end
  end

end
require "yaml"

class Syscomex::Layouts

  def self.visit
    layout_for :visit
  end
  
  private

  def self.layout_for(element)
    @layouts ||= begin 
      result = YAML::load_file("#{File.dirname(__FILE__)}/layouts.yml")
      result = symbolize_keys(result)
    end

    @layouts[element]
  end
  
  def self.symbolize_keys(hash)
    hash.inject({}) do |result, (key, value)|
      new_key = key.is_a?(String) ? key.to_sym : key
      new_value = value.is_a?(Hash) ? symbolize_keys(value) : value
      
      result[new_key] = new_value
      result
    end
  end

  MANIFEST        = %w(N01 N11 A13 A05 A60 A05 A60 A01 A02 A60 A02 A60 A02 A60 A02 A60 A14 A60 A14 A60 A02 A60 A01)
  EMPTY_CONTAINER = %w(N01 A13 A11 A02 A04 A60 A01)
  BILL_OF_LANDING = %w(N01 N15 A13 A13 A13 A13 A13 A13 A13 A13 A13 A13 N02 A04 A01 A25 N02 A35 N08 A01 A18 N15 N14 A115 N14 A115 A14 A115 A253 A14 A115 A01 A30 A55 A253 A14 A115 A253 N08 A506 A05 A60 A05 A60 N14 A115 N10 A03 A01 A02 A60 A02 A60 A02 A60 A02 A60 A01 A02 A55 A01 N15 N12 N13 A253 A11 A11 A11 A11 A11 A11 A11 A11 A11 A11 A02 A15 A01)
  ITEM            = %w(A01 A15 A04 A01 A11 A02 A04 A60 N09 A01 A15 A15 A15 A15 A02 A60 N07 A02 A60 A30 A55 A55 A12 A13 A06 A04 A01 A02 A60 A02 A60 A02 A60 A02 A60 A01)
  NCM             = %w(A01 N15 N04 A08 A140 A01)

end

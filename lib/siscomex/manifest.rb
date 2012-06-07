# encoding: UTF-8

class Siscomex::Manifest < Siscomex::Element

  def self.layout
    @layout ||= {
      visit_number: [:numeric, 11],
      manifest_number: [:text, 13],
      port_of_load_code: [:text, 5],
      port_of_load_name: [:text, 60],
      port_of_discharge_code: [:text, 5],
      port_of_discharge_name: [:text, 60],
      blocked: [ :boolean, 1 ],
      blocking_reason_code_1: [:text, 2],
      blocking_reason_desc_1: [:text, 60],
      blocking_reason_code_2: [:text, 2],
      blocking_reason_desc_2: [:text, 60],
      blocking_reason_code_3: [:text, 2],
      blocking_reason_desc_3: [:text, 60],
      blocking_reason_code_4: [:text, 2],
      blocking_reason_desc_4: [:text, 60],
      agency_cnpj: [:text, 14],
      agency_name: [:text, 60],
      line_operator_cnpj: [:text, 14],
      line_operator_name: [:text, 60],
      type_of_traffic_code: [:text, 2],
      type_of_traffic_description: [:text, 60]
    }
  end

end

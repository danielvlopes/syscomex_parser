class Syscomex::Visit < Syscomex::Element

  def self.layout
    @layout ||= {
      visit_number: [ :numeric, 11 ],
      vessel_imo_code: [ :text, 10 ],
      vessel_name: [ :text, 55 ],
      estimated_berthing_time: [ :date, 8 ],
      realized_berthing_time: [ :date, 8 ],
      blocked: [ :boolean, 1],
      blocking_reason_code_1: [ :text, 2 ],
      blocking_reason_desc_1: [ :text, 60 ],
      blocking_reason_code_2: [ :text, 2 ],
      blocking_reason_desc_2: [ :text, 60 ],
      blocking_reason_code_3: [ :text, 2 ],
      blocking_reason_desc_3: [ :text, 60 ],
      blocking_reason_code_4: [ :text, 2 ],
      blocking_reason_desc_4: [ :text, 60 ],
      travel_number: [:text, 10 ]
    }
  end

end

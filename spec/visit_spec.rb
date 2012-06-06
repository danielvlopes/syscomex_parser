# encoding: UTF-8

require "spec_helper"

describe Siscomex::Visit do

  let(:row) { "1120001634349377482   GRANDE CAMEROON                                        2012052320120526                                                                                                                                                                                                                                                         GCA0312   #" }
  let(:visit) { Siscomex::Visit.new(row) }

  it 'extracts type and line ending char (#) from given row' do
    row.bytesize.should == 353
    visit.row.bytesize.should == 351
  end

  context "attributes" do
    let(:attributes) { visit.attributes }

    {
      visit_number: 12000163434,
      vessel_imo_code: "9377482",
      vessel_name: "GRANDE CAMEROON",
      estimated_berthing_time: Date.new(2012, 5, 23),
      realized_berthing_time: Date.new(2012, 5, 26),
      blocked: false,
      blocking_reason_code_1: "",
      blocking_reason_desc_1: "",
      blocking_reason_code_2: "",
      blocking_reason_desc_2: "",
      blocking_reason_code_3: "",
      blocking_reason_desc_3: "",
      blocking_reason_code_4: "",
      blocking_reason_desc_4: "",
      travel_number: "GCA0312"
    }.each do |attribute, value|
      it "has #{value} for #{attribute}" do
        attributes[attribute].should == value
      end
    end
  end

end
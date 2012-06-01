# encoding: UTF-8

require "./spec_helper"

describe Syscomex::Visit do

  let(:row) { "1120001634349377482   GRANDE CAMEROON                                        2012052320120526                                                                                                                                                                                                                                                         GCA0312   #" }
  let(:visit) { Syscomex::Visit.new(row) }

  it 'extracts type and line ending char (#) from given row' do
    row.bytesize.should == 353
    visit.row.bytesize.should == 351
  end

  context "attributes" do
    let(:attributes) { visit.attributes }
    
    it "has a visit number" do 
      attributes[:visit_number].should == 12000163434
    end

    it "has a vessel imo code" do 
      attributes[:vessel_imo_code].should == "9377482"
    end
    
    it "has a vessel name" do
      attributes[:vessel_name].should == "GRANDE CAMEROON"
    end
    
    it "has a estimated berthing time" do 
      attributes[:estimated_berthing_time].should == 20120523
    end
  end

end

# estimated_berthing_time: "N08",
# realized_berthing_time: "N08",
# realized_berthing_time: "N08",
# blocked: "A01",
# blocking_reason_code_1: "A02",
# blocking_reason_desc_1: "A06",
# blocking_reason_code_2: "A02",
# blocking_reason_desc_2: "A06",
# blocking_reason_code_3: "A02",
# blocking_reason_desc_3: "A06",
# blocking_reason_code_4: "A02",
# blocking_reason_desc_4: "A06",
# travel_number: "A10"

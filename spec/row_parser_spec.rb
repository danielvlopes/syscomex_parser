# encoding: UTF-8

require "./spec_helper"

describe Syscomex::RowParser do

  let(:data_sample) { 
    "12120509148320600011GCNU40284414042G0GENERAL PURPOSE(40'/8'6) - DRY 40'" 
  }

  context "syscomex spec based rows" do

    it 'extracts alphanumeric portions' do
      extracted, rest = Syscomex::RowParser.new(data_sample, "A10").extract
      extracted.should == "1212050914"
      rest.should == "8320600011GCNU40284414042G0GENERAL PURPOSE(40'/8'6) - DRY 40'"
    end

    it 'extracts numeric portions' do
      extracted, rest = Syscomex::RowParser.new(data_sample, "N05").extract
      extracted.should == 12120
      rest.should == "509148320600011GCNU40284414042G0GENERAL PURPOSE(40'/8'6) - DRY 40'"
    end

  end

end

# encoding: UTF-8

require "spec_helper"

describe Siscomex::RowParser do

  let(:data_sample) { 
    "12120509148320600011GCNU40284414042G0GENERAL PURPOSE(40'/8'6) - DRY 40'" 
  }

  context "syscomex spec based rows" do

    it 'extracts alphanumeric portions' do
      extracted, rest = Siscomex::RowParser.new(data_sample, [:text, 10]).extract
      extracted.should == "1212050914"
      rest.should == "8320600011GCNU40284414042G0GENERAL PURPOSE(40'/8'6) - DRY 40'"
    end

    it 'extracts numeric portions' do
      extracted, rest = Siscomex::RowParser.new(data_sample, [:numeric, 5]).extract
      extracted.should == 12120
      rest.should == "509148320600011GCNU40284414042G0GENERAL PURPOSE(40'/8'6) - DRY 40'"
    end

    context "extracting boolean" do
      it 'is true when S' do
        data_sample = "S8320600011GCNU"
        extracted, rest = Siscomex::RowParser.new(data_sample, [:boolean, 1]).extract
        extracted.should == true
        rest.should == "8320600011GCNU"
      end

      it 'is false when N' do
        data_sample = "N8320600011GCNU"
        extracted, rest = Siscomex::RowParser.new(data_sample, [:boolean, 1]).extract
        extracted.should == false
        rest.should == "8320600011GCNU"
      end

      it 'is false when empty' do
        data_sample = " 8320600011GCNU"
        extracted, rest = Siscomex::RowParser.new(data_sample, [:boolean, 1]).extract
        extracted.should == false
        rest.should == "8320600011GCNU"
      end
    end

  end
end
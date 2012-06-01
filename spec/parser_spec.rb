# encoding: UTF-8

require "./spec_helper"

describe Syscomex::Parser do

  let(:parser) { Syscomex::Parser.new("#{File.dirname(__FILE__)}/fixtures/data_iso.txt") }

  context "encoding of the file" do
    it 'converts the original file to the proper encoding (UTF8)' do
      parser.content.encoding.name.should == "UTF-8"
    end
  end

  # context "layout to be used" do
  #   it 'first character of each row defines the type'
  #   it 'finds the layout based on the type'
  # end

end

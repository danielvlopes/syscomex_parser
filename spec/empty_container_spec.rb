# encoding: UTF-8

require "spec_helper"

describe Siscomex::EmptyContainer do

  let(:row) { "31511B02358853CAXU95848454045G1HIGH CUBE (PASSIVE VENTS)(40'/9'6)                          #" }
  let(:empty_container) { Siscomex::EmptyContainer.new(row) }

  context "attributes" do
    let(:attributes) { empty_container.attributes }

    {
      manifest_number: "1511B02358853",
      container_number: "CAXU9584845",
      capacity: "40",
      category_code: "45G1",
      category_name: "HIGH CUBE (PASSIVE VENTS)(40'/9'6)"
    }.each do |attribute, value|
      it "has #{value} for #{attribute}" do
        attributes[attribute].should == value
      end
    end
  end


end
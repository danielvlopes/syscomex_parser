# encoding: UTF-8

require "spec_helper"

describe Siscomex::Manifest do

  let(:row) { "2110003779751211502338524DKKALKALUNDBORG                                                  BRVIXVITORIA                                                                                                                                                                                                                                                                                                              32082489001237OCEANUS AGENCIA MARITIMA SA                                 NL000268      BIGLIFT SHIPPING B.V.                                       05LONGO CURSO IMPORTACAO                                      #" }
  let(:manifest) { Siscomex::Manifest.new(row) }

  it 'extracts type and line ending char (#) from given row' do
    row[0,1].should == "2"
    row[-1,1].should == "#"

    manifest.row[0,1].should_not == "2"
    manifest.row[-1,1].should_not == "#"
  end


  context "attributes" do
    let(:attributes) { manifest.attributes }

    {
      visit_number: 11000377975,
      manifest_number: "1211502338524",
      port_of_load_code: "DKKAL",
      port_of_load_name: "KALUNDBORG",
      port_of_discharge_code: "BRVIX",
      port_of_discharge_name: "VITORIA",
      blocked: false,
      blocking_reason_code_1: "",
      blocking_reason_desc_1: "",
      blocking_reason_code_2: "",
      blocking_reason_desc_2: "",
      blocking_reason_code_3: "",
      blocking_reason_desc_3: "",
      blocking_reason_code_4: "",
      blocking_reason_desc_4: "",
      agency_cnpj: "32082489001237",
      agency_name: "OCEANUS AGENCIA MARITIMA SA",
      line_operator_cnpj: "NL000268",
      line_operator_name: "BIGLIFT SHIPPING B.V.",
      type_of_traffic_code: "05",
      type_of_traffic_description: "LONGO CURSO IMPORTACAO"
    }.each do |attribute, value|

      it "has #{value} for #{attribute}" do
        attributes[attribute].should == value
      end

    end
  end

end
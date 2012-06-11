# encoding: UTF-8

require "spec_helper"

describe Siscomex::BillOfLanding do

  let(:row) { "41211051953108991211502314633                                                                                                                     10BL  IIMPORTADA                06VINCULADA A DOCUMENTO DE DESPACHO O20111107SS305708817                                                                                                                                                                                                                                                                                         39373782000140CISA TRADING S/A                                                                                                   CISA TRADING S/A                                                                                                                                                                                                                                             39373782000140CISA TRADING S/A                                                                                                   N                                                                                     CISA TRADING S/A                                                                                                                                                                                                                                                                                                                                                                              VOLVO CAR OVERSEAS CORP.                                                                                                                                                                                                                                     20111009NEW UNPACKED AUTOMOVEIS DE PASSAGEIROS MARCAVOLVO MODELO XC60 2.0 AUTOMATICO 4 PORTAS +PORTA MALAS ANO DE FABRICACAO 2011 E MODELO 2012 NCM: 8703.2310  FREIGHT PAYABLE AT GOTHENBURG                                                                                                                                                                                                                                                                                                                                     BEANRANTUERPIA (AMBERES)                                         BRVIXVITORIA                                                     32082489001237OCEANUS AGENCIA MARITIMA SA                                                                                        1121100343DI                                                                                                                                                                                                                                                                                                                    N               0000229320000000000195666                                                                                                                                                                                                                                                                                                                                                                           NA               #" }
  let(:bill_of_landing) { Siscomex::BillOfLanding.new(row) }

  it 'extracts type and line ending char (#) from given row' do
    row[0,1].should == "4"
    row[-1,1].should == "#"

    bill_of_landing.row[0,1].should_not == "4"
    bill_of_landing.row[-1,1].should_not == "#"
  end

  context "attributes" do
    let(:attributes) { bill_of_landing.attributes }

    {
      ce_mercante_number: 121105195310899,
      manifest_number1: "1211502314633",
      manifest_number2: "",
      manifest_number3: "",
      manifest_number4: "",
      manifest_number5: "",
      manifest_number6: "",
      manifest_number7: "",
      manifest_number8: "",
      manifest_number9: "",
      manifest_number10: "",
      type_code: 10,
      type_name: "BL",
      cargo_category_code: "I",
      cargo_category_name: "IMPORTADA",
      cargo_status_code: 6,
      cargo_status:  "VINCULADA A DOCUMENTO DE DESPACHO O",
      last_update_cargo_status:  "20111107",
      available: true,
      original_number_of_bl: "S305708817",
      ce_master_number: 0,
      agency_deconsolidation_cnpj: "",
      agency_deconsolidation_name: "",
      line_operator_cnpj: "",
      line_operator_name: "",
      notified_part_registration_code: "39373782000140",
      notified_part_name: "CISA TRADING S/A",
      notified_part_identification_text: "CISA TRADING S/A",
      consignee_registration_code: "39373782000140",
      consignee_name: "CISA TRADING S/A",
      is_a_foreign_consignee: false,
      passport_foreign_consignee_number: "",
      foreign_consignee_name: "",
      consignee_identification_text: "CISA TRADING S/A",
      shipper_registration_code: "",
      shipper_name: "",
      shipper_identification_text: "VOLVO CAR OVERSEAS CORP.",
      issued_on: "20111009",
      merchandise_description_text: "NEW UNPACKED AUTOMOVEIS DE PASSAGEIROS MARCAVOLVO MODELO XC60 2.0 AUTOMATICO 4 PORTAS +PORTA MALAS ANO DE FABRICACAO 2011 E MODELO 2012 NCM: 8703.2310  FREIGHT PAYABLE AT GOTHENBURG",
      port_of_origin_code: "BEANR",
      port_of_origin_name: "ANTUERPIA (AMBERES)",
      port_of_discharge_code: "BRVIX",
      port_of_discharge_name: "VITORIA",
      registration_code_of_the_agency_issuing_the_ce_mercante: "32082489001237",
      name_of_the_agency_issuing_the_ce_mercante: "OCEANUS AGENCIA MARITIMA SA",
      number_of_the_last_document_of_cargo_dispatch: 1121100343,
      type_code_of_the_dispatch_document: "DI",
      blocked_cargo: false,
      blocking_reason_code_1: "",
      blocking_reason_desc_1: "",
      blocking_reason_code_2: "",
      blocking_reason_desc_2: "",
      blocking_reason_code_3: "",
      blocking_reason_desc_3: "",
      blocking_reason_code_4: "",
      blocking_reason_desc_4: "",
      international_deliver: false,
      country_code_for_delivery: "",
      country_name_for_delivery: "",
      service_bl_indicator: false,
      original_ce_mercante_service_bl_number: 0,
      gross_weight: 22932.0,
      cubage: 195.666,
      observations: "",
      ships_convenience_container_number1:  "",
      ships_convenience_container_number2:  "",
      ships_convenience_container_number3:  "",
      ships_convenience_container_number4:  "",
      ships_convenience_container_number5:  "",
      ships_convenience_container_number6:  "",
      ships_convenience_container_number7:  "",
      ships_convenience_container_number8:  "",
      ships_convenience_container_number9:  "",
      ships_convenience_container_number10: "",
      deliver_mode_code: "NA",
      deliver_mode_name: ""
    }.each do |attribute, value|
      it "has #{value} for #{attribute}" do
        attributes[attribute].should == value
      end
    end
  end

end

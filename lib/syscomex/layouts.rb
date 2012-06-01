module Syscomex::Layouts

  VISIT = {
    visit_number: "N11",
    vessel_imo_code: "A10",
    vessel_name: "A55",
    estimated_berthing_time: "N08",
    realized_berthing_time: "N08",
    blocked: "A01",
    blocking_reason_code_1: "A02",
    blocking_reason_desc_1: "A06",
    blocking_reason_code_2: "A02",
    blocking_reason_desc_2: "A06",
    blocking_reason_code_3: "A02",
    blocking_reason_desc_3: "A06",
    blocking_reason_code_4: "A02",
    blocking_reason_desc_4: "A06",
    travel_number: "A10"
  }

  MANIFEST        = %w(N01 N11 A13 A05 A60 A05 A60 A01 A02 A60 A02 A60 A02 A60 A02 A60 A14 A60 A14 A60 A02 A60 A01)
  EMPTY_CONTAINER = %w(N01 A13 A11 A02 A04 A60 A01)
  BILL_OF_LANDING = %w(N01 N15 A13 A13 A13 A13 A13 A13 A13 A13 A13 A13 N02 A04 A01 A25 N02 A35 N08 A01 A18 N15 N14 A115 N14 A115 A14 A115 A253 A14 A115 A01 A30 A55 A253 A14 A115 A253 N08 A506 A05 A60 A05 A60 N14 A115 N10 A03 A01 A02 A60 A02 A60 A02 A60 A02 A60 A01 A02 A55 A01 N15 N12 N13 A253 A11 A11 A11 A11 A11 A11 A11 A11 A11 A11 A02 A15 A01)
  ITEM            = %w(A01 A15 A04 A01 A11 A02 A04 A60 N09 A01 A15 A15 A15 A15 A02 A60 N07 A02 A60 A30 A55 A55 A12 A13 A06 A04 A01 A02 A60 A02 A60 A02 A60 A02 A60 A01)
  NCM             = %w(A01 N15 N04 A08 A140 A01)

end

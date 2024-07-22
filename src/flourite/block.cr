struct Flourite::Block
  alias ID = UInt8
  alias State = UInt8

  property id : ID = 0_u8
  property state : State = 0_u8
end
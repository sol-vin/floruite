

module Flourite::Block::Registry
  @@blocks = {} of Block::ID => Block::Definition

  @@blocks[0_u8] = Block::Definition.new(0_u8, "Air") 
end
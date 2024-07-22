struct Flourite::Block::Definition
  property id : Block::ID
  property name : String
  
  property? is_collidable = false
  property? has_actions? = false
  property? is_transparent = true

  def initialize(@id, @name)
  end

  property on_collide = ->(player : Player, world : World, x : Int64, y : Int64, z : Int64) { } 
  property on_action = ->(player : Player, action : Symbol, x : Int64, y : Int64, z : Int64) { }
end
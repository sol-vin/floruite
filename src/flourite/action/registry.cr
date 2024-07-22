struct Flourite::Action
  getter default : Raylib::KeyboardKey | Raylib::MouseButton
  getter secondary : Raylib::KeyboardKey | Raylib::MouseButton | Nil = nil

  def initialize(@default)
  end

  property on_press = ->{}
  property on_down = ->{}
  property on_release = ->{}
  property on_up = ->{}
end

module Flourite::Action::Registry
  @@actions = {} of Symbol => Action

  @@actions[:move_forward] = Action.new(Raylib::KeyboardKey::W)
  @@actions[:move_backward] = Action.new(Raylib::KeyboardKey::S)
  @@actions[:strafe_left] = Action.new(Raylib::KeyboardKey::A)
  @@actions[:strafe_right] = Action.new(Raylib::KeyboardKey::D)
end
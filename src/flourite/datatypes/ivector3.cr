struct LVector3
  property x : Int64
  property y : Int64
  property z : Int64

  def initialize(@x, @y, @z)
  end

  def *(other : LVector3)
    LVector3.new(
      x * other.x,
      y * other.y,
      z * other.z
    )
  end
end

struct IVector3
  property x : Int32
  property y : Int32
  property z : Int32
  
  def initialize(@x, @y, @z)
  end

  def to_lv3 : LVector3
    LVector3.new(x.to_i64, y.to_i64, z.to_i64)
  end
end

struct USVector3
  property x : UInt16
  property y : UInt16
  property z : UInt16
  
  def initialize(@x, @y, @z)
  end

  def to_lv3 : LVector3
    LVector3.new(x.to_i64, y.to_i64, z.to_i64)
  end
end

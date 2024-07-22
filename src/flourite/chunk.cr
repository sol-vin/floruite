
class Flourite::Chunk
  MAX_X = 32
  MAX_Y = 32
  MAX_Z = 32
  PAGE = MAX_X * MAX_Y
  SIZE = 1_i32 * MAX_X * MAX_Y * MAX_Z
  alias Data = Slice(Block)

  # def self.compress(chunk : Chunk) : Bytes
  #   io = IO::Memory.new
  #   chunk.each do |x, y, z, block|
  #     io.write_byte block.id
  #     io.write_byte block.state
  #   end
  #   io.to_slice
  # end

  # def self.decompress(compressed : Bytes, x, y, z)
  #   raise "Size error" if compressed.size != SIZE * sizeof(Block)
  #   MAX_X.times do |x|
  #     MAX_Y.times do |y|
  #       MAX_Z.times do |z|
          
  #       end
  #     end
  #   end
  # end

  def self.index_to_position(index : Int) : IVector3
    z = (index/(PAGE)).to_i
    y = ((index - z*(PAGE))/MAX_X).to_i
    x = (index % MAX_X).to_i
    IVector3.new(x, y, z)
  end

  def self.position_to_index(x : Int | Float, y : Int | Float, z : Int | Float)
    z * (PAGE) + (y * MAX_X) + x
  end

  getter data : Data = Data.new(SIZE) { Flourite::Block.new }
  getter position : IVector3
  getter world_position : LVector3
  # getter block_entities : Hash(IVector3, BlockEntity)

  getter? only_air = false
  getter? modified = false

  def initialize(x, y, z)
    @position = IVector3.new(x, y, z)
    @world_position = @position.to_lv3 * LVector3.new(MAX_X, MAX_Y, MAX_Z)
  end

  def save
  end

  def load
  end

  # def compress
  #   self.class.compress(self)
  # end

  def [](x : UInt16, y : UInt16, z : UInt16) : Block
    if contains_index?(x, y, z)
      return data[position_to_index[x, y, z]]
    end
    raise "Out of bounds!"
  end

  def []=(x : UInt16, y : UInt16, z : UInt16, block : Block)
    if contains_index?(x, y, z)
      data[position_to_index[x, y, z]] = block
    end
    raise "Out of bounds!"
  end

  def contains?(x : Int | Float, y : Int | Float, z : Int | Float) : Bool
    x >= @position.x * MAX_X && 
    y >= @position.y * MAX_Y && 
    z >= @position.z * MAX_Z && 
    x < @position.x * MAX_X + MAX_X &&
    y < @position.y * MAX_Y + MAX_Y &&
    z < @position.z * MAX_Z + MAX_Z 
  end

  def contains_index?(x : Int, y : Int, z : Int) : Bool
    x >= 0 && 
    y >= 0 && 
    z >= 0 && 
    x < MAX_X &&
    y < MAX_Y &&
    z < MAX_Z 
  end

  def each(&block : Proc(UInt16, UInt16, UInt16, Block, Nil))
    MAX_X.times do |x|
      MAX_Y.times do |y|
        MAX_Z.times do |z|
          yield x, y, z, self[x, y, z]
        end
      end
    end
  end
end
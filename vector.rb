class Vector
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

  def initialize(x,y,z)
    @x=x.to_f
    @y=y.to_f
    @z=z.to_f
  end
  def suma_vector(vector)
    x1 = @x + vector.x
    y1 = @y + vector.y
    z1 = @z + vector.z
    res = new Vector(x1,y1,z1)
    return res
  end
  def resta_vector(vector)
    x1 = @x - vector.x
    y1 = @y - vector.y
    z1 = @z - vector.z
    res = new Vector(x1,y1,z1)
  end

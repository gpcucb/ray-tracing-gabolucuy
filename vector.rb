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
    res = Vector.new(x1,y1,z1)

  end
  def resta_vector(vector)
    x1 = @x - vector.x
    y1 = @y - vector.y
    z1 = @z - vector.z
    res = Vector.new(x1,y1,z1)
  end
  def show
    puts "(#{@x},#{@y},#{z})"
  end
  def  modulo()
    return Math.sqrt(@x*@x + @y*@y + @z*@z)
  end
  def productoVectorial(vector)
    i = (@y * vector.z) - (@z * vector.y)
    j = (@z * vector.x) - (@x * vector.z)
    k = (@x * vector.y) - (@y * vector.x)
    return Vector.new(i, j, k)
  end
  def productoEscalar(vector)
    i = @x + vector.x
    j = @y + vector.y
    k = @z + vector.z
    return (i + j + k).to_f
  end
  def num_product(num)
		return Vector.new(@x*num, @y*num, @z*num)
	end
end

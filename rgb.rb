class Rgb
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue

	def initialize (red, green, blue)
		@red = red.to_f
		@green = green.to_f
		@blue = blue.to_f
	end

  def productoColor(color)
    r = @red * color.red
    g = @green * color.green
    b = @blue * color.blue
    return Rgb.new(r,g,b)
  end
  def productoPorNum(nun)
    r = @red.num_product(num)
    g = @green.num_product(num)
    b = @blue.num_product(num)
    return Rgb.new(r,g,b)
  end
  def sumar(color)
    r = @red + color.x
    g = @green + color.y
    b = @blue + color.z
    return Vector.new(r,g,b)

  end
end

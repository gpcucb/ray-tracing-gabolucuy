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
    return Rgb.new(fix(r),fix(g),fix(b))
  end
  def productoPorNum(num)
    num_float = num.to_f
    r = @red * num_float
    g = @green * num_float
    b = @blue * num_float
    return Rgb.new(fix(r),fix(g),fix(b))
  end
  def sumar(color)
    r = @red + color.red
    g = @green + color.green
    b = @blue + color.blue
    return Rgb.new(fix(r),fix(g),fix(b))
  end
  def fix(num)
    if num<0.0
      num=0.0
    end
    if num>1.0
      num=1.0
    end
    return num
  end
end

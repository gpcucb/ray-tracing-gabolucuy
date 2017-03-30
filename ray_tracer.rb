require_relative 'renderer.rb'
require_relative 'camera.rb'
require_relative 'vector.rb'
require_relative 'rgb.rb'
require_relative 'intersection.rb'
require_relative 'material.rb'

class RayTracer < Renderer

  attr_accessor :camera

  def initialize(width, height)
    super(width, height, 250.0, 250.0, 250.0)

    @nx = @width
    @ny = @height
    # Cámara
    e= Vector.new(278,273,-800)
    center= Vector.new(278,273,-700)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    specular = Rgb.new(1.0,1.0,1.0)
    power = 60
    reflection = 0.5


    # Valores de la esfera
    position = Vector.new(370,120,370)
    radius = 120

    # Valores del triángulo
    a = Vector.new(550.0,0.0,0.0)
    b = Vector.new(110.0,0.0,0.0)
    c = Vector.new(0.0,10.0,550.0)

    @sphere = Sphere.new(position, radius,Material.new(Rgb.new(102.0, 153.0, 0.0),specular,power,reflection))
    @triangle = Triangle.new(a,b,c,Material.new(Rgb.new(102.0, 153.0, 255.0),specular,power,reflection))
    @objects=[]
    @objects << @sphere
    @objects << @triangle
  end
  def max (num1,num2)
    if num1>num2
      return num1
    else
      return num2
    end
  end
  def lambertian_Shading(intersection_point,intersection_normal,ray,light,object)
    n = intersection_normal.normalize
    l= intersection_point.resta_vector(light).normalize
    kd = object.material.diffuse
    nl = max(0,n.productoEscalar(l))

  end
  def calculate_pixel(i, j)
    #degradado
    #color = Rgb.new( 1.0, i.to_f/@nx, j.to_f/@ny)
    #{red: color.red, green: color.green, blue: color.blue}
    e = @camera.eye
    dir = @camera.calcularDistancia(i,j,@nx,@ny)
    ray = Ray.new(e, dir)
    t = Float::INFINITY

    @obj_int = nil
    @objects.each do |obj|
      intersection = obj.intersection?(ray, t)
      if intersection.successful?
        @obj_int = obj
      end
    end
    if @obj_int==nil
      color = Rgb.new(0,0,0)
    else
      color =  @obj_int.material.diffuse
    end

    return {red: color.red, green: color.green, blue: color.blue}
  end
end

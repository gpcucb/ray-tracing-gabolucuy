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
    e= Vector.new(0,0,-800)
    center= Vector.new(0,0,-700)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    specular = Rgb.new(1.0,1.0,1.0)
    power = 60
    reflection = 0.5

    @ambient_light = Rgb.new(0.15,0.15,0.15)
    # Light Values
    light_color = Rgb.new(0.8,0.7,0.6)
    light_position = Vector.new(0.0, 0.0, 200.0)
    @light = Light.new(light_position,light_color)


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
    kd = object.material.diffuse #rgb vector
    nl = n.productoEscalar(l)
    max = max(0,nl)
    kdI = kd.productoColor(light.color) #rbg vector * rgb vector
    return kdi.productoPorNum(max)
  end
  def blinn_Phong_Shading(intersection_point,intersection_normal,ray,light,object)
    n = intersection_normal.normalize
    l= intersection_point.resta_vector(light).normalize
    v = ray.position.resta_vector(intersection_point).normalize
    h = v.suma_vector(l).normalize
    nh =  n.productoEscalar(h)
    p = objetc.material.power
    ks = object.material.specular #rgb vector
    max = max(0,nh)
    ksI = ks.productoColor(light.color)
    return kdi.productoPorNum(max**p)
  end
  def calculate_pixel(i, j)
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
      intersection_point = ray.position.suma_vector(ray.direction.num_product(t))
      intersection_normal = @obj_int.normal(intersection_point)

      lambert = lambertian_Shading(intersection_point,intersection_normal,ray,@light,@obj_int)
      blinn_Phong = blinn_Phong_Shading(intersection_point,intersection_normal,ray,@light, @obj_int)

      #color =  @obj_int.material.diffuse # 2d
      color = lambert #lamberr image
    end

    return {red: color.red, green: color.green, blue: color.blue}
  end
end

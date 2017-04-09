require_relative 'renderer.rb'
require_relative 'camera.rb'
require_relative 'vector.rb'
require_relative 'rgb.rb'
require_relative 'intersection.rb'
require_relative 'material.rb'
require_relative 'ligth.rb'
class RayTracer < Renderer

  attr_accessor :camera

  def initialize(width, height)
    super(width, height, 250.0, 250.0, 250.0)

    @nx = @width
    @ny = @height
    # Cámara
    # e= Vector.new(0,0,-1000)
    # center= Vector.new(0,0,-900)
    e= Vector.new(0,0,-1500)
    center= Vector.new(0,0,-1400)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    specular = Rgb.new(1.0,1.0,1.0)
    power = 60
    reflection = 0.5

    @ambient_light = Rgb.new(0.2,0.15,0.15)
    # Light Values
    light_color = Rgb.new(0.8,0.9,0.9)
    light_position = Vector.new(300.0, 0.0, 50.0)
    @light = Light.new(light_position,light_color)


    # Valores de la esfera
    position = Vector.new(-100,-100,200)
    radius = 20
    #valores para las bolas
    position1b = Vector.new(-200,-150,200)
    position2b = Vector.new(130,-200,200)
    position3b = Vector.new(50,180,200)

    radius1 = 25


    # Valores para mesa billar
    a = Vector.new(-250,300,200)
    b = Vector.new(750,300,200)
    c = Vector.new(-500,-300,200)
    a1 = Vector.new(750,300,200)
    b1 = Vector.new(500,-300,200)
    c1 = Vector.new(-500,-300,200)

    #hoyos de las esquinas y del centro de la mesa
    position1 = Vector.new(-455,-275,200) #lado derecho inferior
    radius1 = 25
    position2 = Vector.new(-215,275,200) #Lado izquierdo inferior
    radius2 = 25
    position3 = Vector.new(475,-275,200) #lado derecho inferior
    radius3 = 25
    position4 = Vector.new(700,275,200) #Lado izquierdo superior
    radius4 = 25
    position5 = Vector.new(0,-275,200)
    radius5 = 25
    position6 = Vector.new(250,275,200)
    radius6 = 25
    #Bordes de la mesa  223, 128, 34
    rigthBa1 = Vector.new(-250,300,200)
    rigthBb1 = Vector.new(-220,300,200)
    rigthBc1 = Vector.new(-470,-300,200)
    rigthBa2 = Vector.new(-250,300,200)
    rigthBb2 = Vector.new(-470,-300,200)
    rigthBc2 = Vector.new(-500,-300,200)

    leftBa1 = Vector.new(720,300,200)
    leftBb1 = Vector.new(750,300,200)
    leftBc1 = Vector.new(500,-300,200)
    leftBa2 = Vector.new(720,300,200)
    leftBb2 = Vector.new(470,-300,200)
    leftBc2 = Vector.new(500,-300,200)

    topBa1 = Vector.new(-245,300,200)
    topBb1 = Vector.new(750,300,200)
    topBc1 = Vector.new(-245,270,200)
    topBa2 = Vector.new(750,300,200)
    topBb2 = Vector.new(-245,270,200)
    topBc2 = Vector.new(750,270,200)

    bottomBa1 = Vector.new(-500,-270,200)
    bottomBb1 = Vector.new(-500,-300,200)
    bottomBc1 = Vector.new(500,-300,200)
    bottomBa2 = Vector.new(-500,-270,200)
    bottomBb2 = Vector.new(500,-270,200)
    bottomBc2 = Vector.new(500,-300,200)

    @sphere = Sphere.new(position, radius1,Material.new(Rgb.new(1,0,1),specular,power,reflection))
    @sphere1 = Sphere.new(position1b, radius1,Material.new(Rgb.new(0.9725,0.03529,0.03529),specular,power,reflection)) #248, 9, 9
    @sphere2 = Sphere.new(position2b, radius1,Material.new(Rgb.new(1,1,0),specular,power,reflection))
    @sphere3 = Sphere.new(position3b, radius1,Material.new(Rgb.new(0,0,0),specular,power,reflection))

    #objetos para mesa
    @mitadMesa1 = Triangle.new(a,b,c,Material.new(Rgb.new(0,1,0),specular,power,reflection))
    @mitadMesa2 = Triangle.new(a1,b1,c1,Material.new(Rgb.new(0,1,0),specular,power,reflection))
    #objetos para bordes
    @bordeDerecho1 = Triangle.new(rigthBa1,rigthBb1,rigthBc1,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeDerecho2 = Triangle.new(rigthBa2,rigthBb2,rigthBc2,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeIzquierdo1 = Triangle.new(leftBa1,leftBb1,leftBc1,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeIzquierdo2 = Triangle.new(leftBa2,leftBb2,leftBc2,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeSuperior1 = Triangle.new(topBa1,topBb1,topBc1,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeSuperior2 = Triangle.new(topBa2,topBb2,topBc2,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeInferior1 = Triangle.new(bottomBa1,bottomBb1,bottomBc1,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    @bordeInferior2 = Triangle.new(bottomBa2,bottomBb2,bottomBc2,Material.new(Rgb.new(0.87451,0.50196,0.13333),specular,power,reflection))
    #objetos para hoyos
    @hole1 = Sphere.new(position1, radius1,Material.new(Rgb.new(0.1176,0.1137,0.1098),specular,power+100000,reflection))
    @hole2 = Sphere.new(position2, radius2,Material.new(Rgb.new(0.1176,0.1137,0.1098),specular,power+100000,reflection))
    @hole3 = Sphere.new(position3, radius3,Material.new(Rgb.new(0.1176,0.1137,0.1098),specular,power+100000,reflection))
    @hole4 = Sphere.new(position4, radius4,Material.new(Rgb.new(0.1176,0.1137,0.1098),specular,power+100000,reflection))
    @hole5 = Sphere.new(position5, radius5,Material.new(Rgb.new(0.1176,0.1137,0.1098),specular,power+100000,reflection))
    @hole6 = Sphere.new(position6, radius6,Material.new(Rgb.new(0.1176,0.1137,0.1098),specular,power+100000,reflection))

    @objects=[]
    @objects << @mitadMesa1 << @mitadMesa2 << @bordeDerecho1 << @bordeDerecho2<< @bordeIzquierdo1 << @bordeIzquierdo2 << @bordeSuperior1 << @bordeSuperior2 << @bordeInferior1 << @bordeInferior2 << @sphere << @sphere1 << @sphere2 << @sphere3 << @hole1 << @hole2 << @hole3 << @hole4 << @hole5 << @hole6

  end
  def max (num1,num2)
    if num1>num2
      return num1
    else
      return num2
    end
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
  def lambertian_Shading(intersection_point,intersection_normal,ray,light,object)
    n = intersection_normal.normalize
    l= light.position.resta_vector(intersection_point).normalize
    kd = object.material.diffuse #rgb vector
    nl = fix(n.productoEscalar(l))
    max = max(0,nl)
    kdI = kd.productoColor(light.color) #rbg vector * rgb vector
    return kdI.productoPorNum(max)
  end
  def blinn_Phong_Shading(intersection_point,intersection_normal,ray,light,object)
    n = intersection_normal.normalize
    l= light.position.resta_vector(intersection_point).normalize
    v = ray.position.resta_vector(intersection_point).normalize
    h = v.suma_vector(l).normalize
    nh =  fix(n.productoEscalar(h))
    p = object.material.power
    ks = object.material.specular #rgb vector
    max = max(0,nh)
    ksI = ks.productoColor(light.color)
    return ksI.productoPorNum(max**p)
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
         t = intersection.t
      end
    end
    if @obj_int==nil
      color = Rgb.new(0,0,0)
    else
      intersection_point = ray.position.suma_vector(ray.direction.num_product(t))
      intersection_normal = @obj_int.normal(intersection_point)

      lambert = lambertian_Shading(intersection_point,intersection_normal,ray,@light,@obj_int)
      blinn_Phong = blinn_Phong_Shading(intersection_point,intersection_normal,ray,@light, @obj_int)

      obj =  @obj_int.material.diffuse # 2d
      #color = lambert #lambert
      #color = lambert.sumar(blinn_Phong)
      color = lambert.sumar(blinn_Phong).sumar(@ambient_light.productoColor(obj)) #lamberr image
    end

    return {red: color.red, green: color.green, blue: color.blue}
  end
end

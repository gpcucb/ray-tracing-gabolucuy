require_relative 'vector.rb'
require_relative 'camera.rb'
require_relative 'Sphere.rb'
require_relative 'Triangle.rb'
require_relative 'Ray.rb'
require_relative 'ray_tracer.rb'
require_relative 'sphere.rb'


#Valores de la cámara
# e= Vector.new(278,273,-800)
# center= Vector.new(278,273,-700)
# up= Vector.new(0,1,0)
# fov= 39.31
# df=0.035
#
# nx = 640.0
# ny = 480.0
#
# # Valores de la esfera
# position = Vector.new(370,120,370)
# radius = 120
#
# camera = Camera.new(e, center, up, fov, df)
# sphere = Sphere.new(position, radius)
#
# (0...nx).each do |i|
#  (0...ny).each do |j|
#    dir = camera.calcularDistancia(i,j,nx,ny)
#    ray = Ray.new(e, dir)
#    sphere.intersection?(ray)
#  end
# end
renderer = RayTracer.new(640.0, 480.0)
renderer.render('Raytracing', 'raytracing.png')

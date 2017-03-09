require_relative 'vector.rb'
class Camera
	attr_accessor :e,:center,:up

	def initialize(e,center,up)
		@e = e #vector
		@center = center #vector
		@up = up #vector		
	end
  
	def vectorW()
		x = @e.x / @e.modulo
		y = @e.y / @e.modulo
		z = @e.z / @e.modulo
		return Vector.new(x,y,z)
	end

	def vectorU(vectorW)
		prod = @up.productoVectorial(vectorW)
		x = @prod.x / @e.modulo
		y = @prod.y / @e.modulo
		z = @prod.z / @e.modulo
		return Vector.new(x,y,z)
	end
	def vectorV(vectorW,vectorU)
		return vectorW.productoVectorial(vectorU)
		
	end
	def calcularDistancia(i, j, nx, ny)
		
	end
end


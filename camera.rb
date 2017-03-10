require_relative 'vector.rb'
class Camera
	attr_accessor :e,:center,:up,:fov,:df

	def initialize(e,center,up,fov,df)
		@e = e #vector
		@center = center #vector
		@up = up #vector
		@fov = fov.to_f #escalar
		@df = df.to_f #escalar
	end

	def vectorW
		d = @e.resta_vector(@center)
		x = d.x / d.modulo
		y = d.y / d.modulo
		z = d.z / d.modulo
		return Vector.new(x,y,z)
	end

	def vectorU(vectorW)
		prod = @up.productoVectorial(vectorW)
		x = prod.x / @e.modulo
		y = prod.y / @e.modulo
		z = prod.z / @e.modulo
		return Vector.new(x,y,z)
	end
	def vectorV(vectorW,vectorU)
		return vectorW.productoVectorial(vectorU)

	end

	def calcularDistancia(i, j, nx, ny)
			t = df * Math::tan(@fov / 2).to_f
			b = -t
			r = (((nx.to_f * t) / ny.to_f)).to_f
			l = -r
			u = l + ((r - l) * (i + 0.5) ) / nx
			v = b + ((t - b) * (j + 0.5) ) / ny
			dw = vectorW.num_product(-@df)
			uu = (vectorU(vectorW)).num_product(u)
			vv = (vectorV(vectorW,vectorU(vectorW))).num_product(v)
			return dw.suma_vector(uu.suma_vector(vv))

	end



end

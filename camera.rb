require_relative 'vector.rb'
class Camera
	attr_accessor :eye,:center,:up,:fov,:df

	def initialize(eye,center,up,fov,df)
		@eye = eye #vector
		@center = center #vector
		@up = up #vector
		@fov = ((fov * Math::PI)/180).to_f #why? convert degrees to radians
		@df = df.to_f #escalar
	end

	def vectorW
		d = @center.resta_vector(@eye)
		x = d.x / d.modulo
		y = d.y / d.modulo
		z = d.z / d.modulo
		return Vector.new(-x,-y,-z)
	end

	def vectorU(vectorW)
		prod = @up.productoVectorial(vectorW)
		x = prod.x / @eye.modulo
		y = prod.y / @eye.modulo
		z = prod.z / @eye.modulo
		return Vector.new(x,y,z)
	end
	def vectorV(vectorW,vectorU)
		return vectorW.productoVectorial(vectorU)
	end

	def calcularDistancia(i, j, nx, ny)
			t = df * Math::tan(@fov / 2).to_f
			b = -t
			r = (((nx * t) / ny)).to_f
			l = -r

			u = l + ((r - l) * (i + 0.5) ) / nx
			v = b + ((t - b) * (j + 0.5) ) / ny

			dw = vectorW.num_product(-@df)
			uu = (vectorU(vectorW)).num_product(u)
			vv = (vectorV(vectorW,vectorU(vectorW))).num_product(v)

			return dw.suma_vector(uu.suma_vector(vv))

	end



end

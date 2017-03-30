require_relative 'intersection.rb'
class Sphere

	attr_accessor :radius, :position, :material

	def initialize (position,radius,material)
		@position = position
		@radius = radius.to_f
		@material = material
	end

	def intersection? (ray,t)
		e = ray.position
		d = ray.direction
		a = d.productoEscalar(d)
		ec = e.resta_vector(@position)

		b = d.num_product(2).productoEscalar(ec)
		c = ec.productoEscalar(ec) - @radius**2


		discriminant = b**2 - 4*a*c

	 return Intersection.unsuccessful if (discriminant < 0.0)

	 puts "(A:#{a} B:#{b} C:#{c})"

	 t0 = ((b * -1) - Math.sqrt(discriminant))/(2*a)
	 t1 = ((b * -1) + Math.sqrt(discriminant))/(2*a)

	 success = false

	 if((t0 > 0.1) && (t0 < t))
		 t = t0
		 success = true
	 end
	 if((t1 > 0.1) && (t1 < t))
		 t = t1
		 success = true
	 end

	 Intersection.new(t, success)
 end
	def normal (intersertion_point)
			intersection_normal = intersertion_point.resta_vector(@position)
			return Vector.new(intersection_normal.x / @radius, intersection_normal.y / @radius,intersection_normal.z / @radius)
	end

end

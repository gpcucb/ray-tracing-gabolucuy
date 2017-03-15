class Sphere
require_relative 'vector.rb'
	attr_accessor :radius, :position

	def initialize (position,radius)
		@position = position
		@radius = radius.to_f
	end

	def intersection? (ray)
		e = ray.position
		d = ray.direction
		a = d.productoEscalar(d)
		ec = e.resta_vector(@position)
		b = d.num_product(2).productoEscalar(ec)
		c = ec.productoEscalar(ec) - @radius**2

		puts "(A:#{a} B:#{b} C:#{c})"
	end

end

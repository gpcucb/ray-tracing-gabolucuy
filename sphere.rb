class Sphere
require_relative 'vector.rb'
	attr_accessor :radius :position

	def initialize (radius,position)
		@position = position
		@radius = radius.tog
	end

	

end

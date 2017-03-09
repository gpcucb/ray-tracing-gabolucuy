require_relative 'vector.rb'

vector1 = Vector.new(1,2,3)
vector2 = Vector.new(45,78,23)

vector1.show()
vector2.show()

sum = vector1.suma_vector(vector2)
sum.show()

res = vector1.resta_vector(vector2)
res.show()

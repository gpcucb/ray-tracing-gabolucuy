class Material
  attr_accessor :diffusse, :specular, :power, :reflection

  def initialize(diffusse, specular, power, reflection)
    @diffusse = diffusse
    @specular = specular
    @power = power
    @reflection = reflection
  end

end

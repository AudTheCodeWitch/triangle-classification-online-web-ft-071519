class Triangle
  attr_reader :equilateral, :isosceles, :scalene, :side_a, :side_b, :side_c
  
  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    
  end
  
  def get_married(person)
    self.partner = person
    if person.class != Person
      begin
        raise PartnerError
      rescue PartnerError => error
          puts error.message
      end
    else
      person.partner = self
    end
  end
  
  def kind
    if side_a == 0 && side_b == 0 && side_c == 0 
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    else
      if side_a == side_b && side_b == side_c
        :equilateral
      elsif side_a == side_b && side_c != side_b
        :isosceles
      elsif side_b == side_c && side_a != side_b
        :isosceles
      elsif side_a == side_c && side_c != side_b
        :isosceles
      elsif side_a != side_b && side_a != side_c && side_b != side_c
        :scalene
      else
        begin
          raise TriangleError
        rescue TriangleError => error
          puts error.message
        end
      end
    end
    
  end
  
  class TriangleError < StandardError
    def message
      "Not a triangle!"
    end
  end
end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name    
  end

  def greeting
    "Hi, my name is #{name}"
  end

end


class Student < Person
  def learn
    "I get it!"
  end
end

class Instructor < Person
  def teach
    "Everything in Ruby is an Object"
  end
end

x = Student.new
puts x.learn
y = Instructor.new
puts y.teach

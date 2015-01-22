class Student
  def learn
    "I get it!"
  end
end

class Instructor
  def teach
    "Everything in Ruby is an Object"
  end
end

x = Student.new
puts x.learn
y = Instructor.new
puts y.teach
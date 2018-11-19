
#Adding students to array

def input_students
  puts "Please enter the names of the students:"
  puts "To finish, just hit return twice"
  #Creates empty array
  students = []
  #Gets students name
  name = gets.chomp
  #Unless names is empty, loop code
  while !name.empty? do
    #Adds student to the array as a hash
    students << {name: name, cohort: :November}
    puts "Now we have #{students.count} students"
    # Takes the next name
    name = gets.chomp
  end
  #returns complete students array
  students
end

def print_header
  puts "The students of Villains Academy:"
  puts "-------------"
end

def print(names)
  names.each_with_index do |student, number|
    if student[:name].start_with?("A")
      puts "#{number+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
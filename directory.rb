
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates empty array
  students = []
  # user inputs the first name
  name = gets.chomp
  # while name is not nil, repeat this code
  
  while !name.empty? do
    # add the student to the array as a hash
    puts "What is #{name}'s star sign?"
    sign = gets.chomp
    puts "What is #{name}'s date of birth?"
    dob = gets.chomp
    students << {name: name, cohort: :november, sign: sign, dob: dob}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy are:"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, number|
    to_print = "#{number+1}. #{student[:name]} (#{student[:cohort]} cohort). Born #{student[:dob]} so they are a #{student[:sign]}"
    puts to_print.center(to_print.length+4)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
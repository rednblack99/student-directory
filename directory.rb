
#Adding students to array

def input_students
  puts "Please enter the names of the students:"
  puts "To finish, just hit return twice"
  #Creates empty array
  $students = []
  $student_count = 0
  #Gets students name
  name = gets.chomp
  #Unless names is empty, loop code
  while !name.empty? do
    #Adds student to the array as a hash
    $student_count += 1
    $students << [name, :november]
    puts "Now we have #{$student_count} students"
    # Takes the next name
    name = gets.chomp
  end
  #returns complete students array
  $students
end

def print_header
  puts "The students of Villains Academy are:"
  puts "-------------"
end

def print(names)
  rounds = 0
  student_index = 0
  while rounds < $student_count do
    name_to_print = $students[rounds][0]
    cohort_to_print = $students[rounds][1]
    puts "#{name_to_print} (#{cohort_to_print} cohort)"
    rounds += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{$student_count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

@students = []

def print_menu
  puts "Welcome to the Villain's Academy Student Registry. What would you like to do today?"
  puts "1. Input new students"
  puts "2. Show existing students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  if @students == []
    puts "There are no students at Villain's Academy :("
  else
    print_header
    print_students_list
    print_footer
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "That wasn't a valid option. Please select from the numbers above."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)    
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # user inputs the first name
  name = gets.delete("\n")
  # while name is not nil, repeat this code
  while !name.empty? do
    # add the student to the array as a hash
    cohort = "No cohort assigned"
    until cohort == "November" || cohort == "October"
      puts "What cohort is #{name} in?"
      cohort = gets.delete("\n").capitalize
    end
    @students << {name: name, cohort: cohort.to_sym}
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "What is the next student's name?"
    name = gets.delete("\n")
  end
 end

 def save_students
  # Open a file
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_header
  puts "The students of Villains Academy are:"
  puts "-------------"
end

def print_students_list
  puts "Students in October cohort:"
    @students.each do |student|
    if student[:cohort] == :October
      puts "#{student[:name]}"
    end
  end
  puts "Students in November cohort:"
  @students.each do |student|
    if student[:cohort] == :November
      puts "#{student[:name]}"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu

def interactive_menu
  students = []
  loop do
    #1. Print the menu and ask the user what to do
    puts "Welcome to the Villain's Academy Student Registry. What would you like to do today?"
    puts "1. Input new students"
    puts "2. Show existing students"
    puts "9. Exit"
    # 2. Read the input and save it to a variable
    selection = gets.chomp
    # 3. Do what the user asked us to
    case selection
    when "1"
      students = input_students
    when "2"
      if students == []
        puts "There are no students at Villain's Academy :("
      else
        print_header
        print(students)
        print_footer(students)
      end
    when "9"
      exit
    else
      puts "That wasn't a valid option. Please select from the numbers above."
    end
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates empty array and rounds counter
  students = []
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
    students << {name: name, cohort: cohort.to_sym}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "What is the next student's name?"
    name = gets.delete("\n")
  end
   
  # return the array of students
  students
 end

def print_header
  puts "The students of Villains Academy are:"
  puts "-------------"
end

def print(students) 
  puts "Students in October cohort:"
    students.each do |student|
    if student[:cohort] == :October
      puts "#{student[:name]}"
    end
  end
  puts "Students in November cohort:"
  students.each do |student|
    if student[:cohort] == :November
      puts "#{student[:name]}"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu
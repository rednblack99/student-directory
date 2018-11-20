
@students = []

def print_menu
  puts "Welcome to the Villain's Academy Student Registry. What would you like to do today?"
  puts "1. Input new students"
  puts "2. Show existing students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
  when "4"
    load_students
  when "9"
    exit
  else
    puts "That wasn't a valid option. Please select from the numbers above."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)    
  end
end

def input_students
  num_new_students = 0
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # user inputs the first name
  @name = STDIN.gets.delete("\n")
  # while name is not nil, repeat this code
  while !@name.empty? do
    # add the student to the array as a hash
    add_students
    num_new_students +=1
    
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "What is the next student's name?"
    @name = STDIN.gets.delete("\n")
  end
  puts "#{num_new_students} students succesfully added"
end

def add_students
  @students << {name: @name, cohort: :November}
end

 def load_students
  puts "Where would you like to load the students from?"
  filename = gets.chomp
  if filename.empty?
    filename = "students.csv"
  end
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(",")
      add_students
    end
  end
  puts "New students succesfully loaded"
end

 def save_students
  puts "Please enter a name to save the students to:"
  filename = gets.chomp
  if filename.nil?
    filename = "students.csv"
  end
  # Open a file
  file = File.open((filename + ".csv", "w") do |file|
  # Iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "New students succesfully saved"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def print_header
  puts "The students of Villains Academy are:"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu
# Makers Academy Student Directory
puts "\n***** Hello stranger, and welcome to my code my student directory :D*****"
	@students = [] #Global array 

#1. Show the menus and all admin methods
def show_menu # 1. print the menu and ask the user what to do
	puts "\n1. Input the students"
	puts "2. Show the students\n3. Save list to students.csv\n4. Load list from students.csv"
	puts "9. Exit"
end
def display(students)
  header
  details(@students)
  footer(students)
end
def header #header 
   puts "\nThanks to your input, here is the cohort list @ Makers Academy"
   puts "-------------"
end
def details(students) # Then the list of names I received in the input method
   students.each do |student|
     puts "#{student[:name]}, #{student[:cohort]}" 
   end
end
def footer(students) # Finally the last part 
   puts "--\nAll and all, we have #{students.length} courageous and amazing students"
end

#2. Process the user inputs	
def menu
	try_load if ARGV.count == 1
	loop do
		show_menu
		process(STDIN.gets.chomp, @students)
    end
end
def input(students) 
		name = prompt "Student name: " 
		cohort = prompt "What about the cohort? "
		#later, add a {y,n} method to ask for more user inputs..
		@students << {name: name, cohort: cohort} #Hash all back to my array
end

def prompt(message)
	print message
	STDIN.gets.chomp.capitalize
end

def process(selection, students)
    case selection
    when "1" # input the students 
  	students = input(students)
    when "2" # show the students
    display(students)
    when "9" # this will cause the program to terminate
    exit 
	when "3" # save the student list to a csv file
	save_file(students)
	when "4"
	try_load #load the students' list
    else
    puts " \nHmm... I am not sure what you meant, please try again"
    end
end

#3. Save and Load external files
def save_file(students) #open the file for writing
	puts students
	File.open("students.csv", "w") do |file|
		students.each do |student|
			student_data = [student[:name], student[:cohort]]
			csv_line = student_data.join(",")
			file.puts csv_line
		end
	end
end
def try_load
	filename = ARGV.first || "students.csv"
	if File.exist?(filename)
		load(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry mate, #{filename} doesn't exist."
	end
end
def load(filename)
	File.open(filename, "r") do |file|
		file.readlines.each do |line|
			name, cohort = line.chomp.split(',')
			@students << {name: name, cohort: cohort.to_sym}
		end
	end
end

# # Now , I am calling everything so that it appears nice and clean in Ruby
 menu
 students = input
 header
 details(students)
 footer(students)

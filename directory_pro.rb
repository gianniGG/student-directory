# Create a student directory for Makers Academy Cohort
# Introduction (because I am a polite guy)
puts "\n***** Hello stranger, and welcome to my code my student directory :D*****"

@students = [] # an empty array accessible to all methods

def menu
	students= []
	loop do
	print_menu
	process(gets.chomp, students)
    end
end
	# @students = [] # This is a global method to be used everywhere in the Script
def print_menu # 1. print the menu and ask the user what to do
	puts "\n1. Input the students"
	puts "2. Show the students"
	puts "3. Save the students to students.csv"
	puts "9. Exit"
end

def input_students(students) 
		print "\nWanna add a student to the directory? [y/n]: " # Yes or No command
	if gets.chomp.strip.downcase == "y"
		print "Student name: " 
		name = gets.chomp.capitalize #Enter the name
		print "What about the cohort? "
		cohort = gets.chomp.capitalize #Enter cohort
		students << {name: name, cohort: cohort} #Hash all back to my array
	else
    end
    students
end

def show_students(students)
  print_header
  print_names_cohort(students)
  print_footer(students)
end

def process(selection, students)
    case selection
    when "1" # input the students 
  	students = input_students(students)
    when "2" # show the students
    show_students students
    when "9" # this will cause the program to terminate
    exit 
	when "3" # save the student list to a csv file
	save_students(students)
    else
    puts " \nHmm... I am not sure what you meant, please try again"
    end
end

def print_header #Header 
   puts "\nThanks to your input, here is the cohort list @ Makers Academy"
   puts "-------------"
end
 
def print_names_cohort(students) # Then the list of names I received in the input method
   students.each do |student|
     puts "#{student[:name]}, #{student[:cohort]}" 
   end
end

def print_footer(students) # Finally the last part 
   puts "-------------"
   puts "All and all, we have #{students.length} courageous and amazing students"
end

def save_students(students) #open the file for writing
	puts students
	file = File.open("students.csv", "w")
	students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end


# # Now , I am calling everything so that it appears nice and clean in Ruby
 menu
 students = input_students
 print_header
 print_names_cohort(students)
 print_footer(students)

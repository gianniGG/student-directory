# Create a student directory for Makers Academy Cohort
# Introduction (because I am a polite guy)
puts "\n***** Hello stranger, and welcome to my code my student directory :D*****"

	@students = [] # This is a global method to be used everywhere in the Script
def print_menu # 1. print the menu and ask the user what to do
	puts "\n1. Input the students"
	puts "2. Show the students"
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
    when "1"
  # input the students 
  	students = input_students(students)
    when "2"
  # show the students
  show_students students
    when "9"
  exit # this will cause the program to terminate
    else
  puts "I am not sure what you meant, please try again"
    end
end
 

def menu
	students= []
	loop do
	print_menu
	process(gets.chomp, students)
    end
end

# # Now my code is written, I define methods to print the directory outcome
# # First, the header
def print_header
   puts "\nThanks to your input, here is the cohort list @ Makers Academy"
   puts "-------------"
end
 # Then the list of names I received in the input method
def print_names_cohort(students)
   students.each do |student|
     puts "#{student[:name]}, #{student[:cohort]}" 
   end
end
# # Finally the last part 
def print_footer(students)
   puts "-------------"
   puts "All and all, we have #{students.length} courageous and amazing students"
end

# # Now , I am calling everything so that it appears nice and clean in Ruby
 menu
 students = input_students
 print_header
 print_names_cohort(students)
 print_footer(students)
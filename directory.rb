# Hello. Here is my way of getting the directory into Ruby.
print "Hello, and welcome to my code :D

"
def input_students 
# First of all, we are creating a blank array for the Students we are adding to our directory
	#print_names_cohort(name, cohort)
	print "\n"
	@students = []
	while true
		print "Would you like to enter a student in the directory? [y/n]: "
		if gets.chomp.strip.downcase == "y"
			print "Student Name or Nickname: "
			name = gets.chomp
			print "What about the cohort?"
			cohort =gets.chomp
			@students << {name: name, cohort: cohort}
			print "\n\n"
			print_names_cohort(@students)
		else
			break
		end
	end
end



# 	print "First, can you please enter the names of the students/nAnd when you're done editing, just hit return twice.. Thanks"
# 	# create an empty array	
# 	students = []
# 	# get the first name and the cohort
# 	name = gets.chomp
# 	cohort = gets.chomp
# 	# while the name is not empty, repeat this code
# 	while !name.empty? do
# 		# add the student hash to the array
# 		students << { :name => name, :cohort => :november}
# 		puts "Now we have #{students.length} students"
# 		#get another name from the user
# 		name = gets.chomp
# 	end
# 	#return the array of students
# 	students
# end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_names_cohort(students)
  students.each_with_index do |student|
    puts "#{@students[:name]} (#{@students[:cohort]})"
  end
end

def print_footer(students)
	# puts students.class
  puts "Overall, we have #{@students.length} great students"
end

# nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)

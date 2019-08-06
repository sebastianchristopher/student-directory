class StudentDirectory
  def initialize
    @students = [
    {name: "Dr. Hannibal Lecter", cohort: :december, hobbies: "Guzzling chianti and human flesh"},
    {name: "Darth Vader", cohort: :november, hobbies: "Conquering all known galaxies/working out Father-Son issues"},
    {name: "Nurse Ratched", cohort: :november, hobbies: "Tormenting the mentally ill"},
    {name: "Michael Corleone", cohort: :november, hobbies: "Horse head installation"},
    {name: "Alex DeLarge", cohort: :november, hobbies: "Ultraviolence/Beethoven"},
    {name: "The Wicked Witch of the West", cohort: :november, hobbies: "Gingham revenge fantasy"},
    {name: "Terminator", cohort: :november, hobbies: "Terminating stuff/Being German"},
    {name: "Freddy Krueger", cohort: :november, hobbies: "Dream police"},
    {name: "The Joker", cohort: :november, hobbies: "Crime/clowning"},
    {name: "Joffrey Baratheon", cohort: :november, hobbies: "Benefitting from nepotism/incest"},
    {name: "Norman Bates", cohort: :december, hobbies: "Murder/working out Mother-Son issues"}
    ]
  end

  def show_students
    print_header
    # group_by_cohort.each { |person| puts person }
    print_students
    print_footer
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  end

  def process_menu_input(selection)
    case selection
    when "1"
      input_student
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end

  def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process_menu_input(selection)
  end

end

  def input_student
    puts "Please enter the names of the student"
    name = gets.chomp
    while name.empty? do
      name = gets.chomp
    end
    puts "Please enter the cohort of the student"
    cohort = gets.chomp
    while cohort.empty? do
      cohort = gets.chomp
    end

    @students << { name: name, cohort: cohort.to_sym }
  end

  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def print_students
    @students.each_with_index do |student, index|
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) - hobbies include #{student[:hobbies]}".center(20)
    end
  end

  def print_footer
    puts "Overall, we have #{@students.count} great #{fix_plural(@students.count, "student")}"
  end

  def group_by_cohort
    @students.group_by { |k, v| k[:cohort] }.each { |line| puts line }
  end

  def fix_plural(count, string)
    count > 1 ? "#{string}s" : string
  end

  def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each { |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    }
    file.close
  end
end

stdir = StudentDirectory.new
stdir.interactive_menu

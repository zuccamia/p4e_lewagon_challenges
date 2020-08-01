class Computer
    @@users = {} #Keep track of all the users
    @@files = {}  #Store files to be created later
  
    def initialize(username, password)
      @username = username
      @password = password
      @@users[username] = password
      puts "#{username.capitalize} virtual computer is ready!"
    end
    
  #Create a file on an instance of class Computer  
    def create(filename)
      @filename = filename
      time = Time.now
      @@files[@filename] = time 
      puts "A new file: #{@filename} has been created by #{@username} at #{time}."
    end
       
  #Delete a file
    def delete(filename)
        @filename = filename
        time = Time.now
        if @@files.has_key?(@filename) == false
           puts "File not found"
           print "Would you like to add a new file? Y/N >> "
           @answer = gets.chomp
            if @answer.downcase == "y"
                create(@filename)
            else puts "Alright."
            end
        elsif 
            @@files.delete(@filename)
            puts "File: #{@filename} has been deleted"
        else puts "Input error."
        end
    end

  #Define a class method to return all items in the @@users hash.
    def Computer.get_users
      @@users.keys
    end

  #Display all files in the system
    def Computer.get_files
        @@files
    end
end

#Create an instance of the Computer class
def new
  puts "What is your username?"
  username = gets.chomp
  puts "What is your password?"
  password = gets.chomp
  my_computer = Computer.new(username.to_s,password.to_s)
end
  
request = ""
until request == "quit"
  puts "What would you like to do with your new VM?"
  puts "> Add a new user: type new"
  puts "> Add a new file: type add"
  puts "> Delete a file: type del"
  puts "> View all files: type file"
  puts "> View all users: type user"
  puts "> Quit: type quit"
  request = gets.chomp

  case request
  when "new"
    new
  when "add"
    puts "What is the file name?"
    filename = gets.chomp 
    my_computer.create(filename)
  when "del"
    puts "What file would you like to delete?"
    filename = gets.chomp
    my_computer.delete(filename)
  when "file"
    puts Computer.get_files
  when "user"
    puts Computer.get_users
  end
end
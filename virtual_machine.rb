class Computer
    #Keep track of all the users
    @@users = {}
  
    def initialize(username, password)
      @username = username
      @password = password
      @@users[username] = password
      @files = {}  #Store files to be created later
    end
    
  #Create a file on an instance of Computer  
    def create(filename)
      @filename = filename
      time = Time.now
      @files[@filename] = time
      puts "A new file: #{@filename} has been created by #{@username} at #{time}."
    end
  
  #Delete a file
    def delete(filename)
        @filename = filename
        time = Time.now
        #Check if a file already exists, else delete
        @files.each do |file|
          if file != @filename
             puts "File not found"
          else 
             @files.delete(@filename)
             puts "File: #{@filename} has been deleted"
          end
        end
    end

  #Define a class method to return all items in the @@users hash.
    def Computer.get_users
      @@users
    end
  end
  
  #Create an instance of the Computer class
  my_computer = Computer.new("zuccamia","73149")
  
  my_computer.create("I was born from a VM!")

  my_computer.delete("I am a new file!")

  puts Computer.get_users
  
  
  
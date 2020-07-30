#Create a hash and assign it to the variable "movies". 
#Put in your favorite movie as the key, with a number rating for the value.
movies = {
  "life is beautiful": 5,
  "knives out": 4,
  inception: 4,
  titanic: 3,
  interstellar: 3,
}
#Prompt the user for input and save that input in a variable called "choice".
puts "What would you like to do?"
puts ">> Type add to add a movie and its rating"
puts ">> Type update to update the rating of a movie"
puts ">> Type display to view all movies"
puts ">> Type delete to remove a movie"
choice = gets.chomp.downcase

#Condition action to each input
case choice
  when "add"
    puts "What movie would you like to add?"
    title = gets.chomp.to_sym
    p title
    if movies[title.to_sym] == nil
      puts "How do you rate this movie (type a number from 0-5)?"
      rating = gets.chomp.to_i
      movies[title] = rating
      puts "Movie: #{title} has been added with a rating of #{rating}."
    else
      puts "This movie is already in the list."
    end
  when "update"
    puts "Which movie would you like to update?"
    title = gets.chomp
    if movies[title.to_sym] == nil
      puts "What is the new rating (type a number from 0 to 4)?"
      rating = gets.chomp.to_i
      movies[title] = rating
      puts "Movie: #{title} has been updated with the new rating of #{rating}."
    else
      puts "This movie is not yet in the list."
    end
  when "display"
    movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
    end
  when "delete"
    puts "What movie would you like to remove?"
    title = gets.chomp
    if movies[title.to_sym] != nil
      movies.delete(title.to_sym)
      puts "Movie: #{title} has been removed from the list."
    else
      puts "Movie #{title} is not in the list."
    end
  else
    puts "Error!"
end

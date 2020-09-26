class Account
    attr_reader :name
    attr_reader :balance
  
    def initialize(name, balance=100)
      @name = name
      @balance = balance
    end
    
    # Display account balance 
    def display_balance(pin_number)
      puts pin_number == pin ? "Balance:$#{@balance}." : pin_error
    end
    
    # Let user withdraw from their accounts
    # Include error checking that prevents users from overdrawing their accounts
    def withdraw(pin_number, amount)
      if @balance - amount < 0
        puts "Insufficient balance."
      elsif @balance - amount >= 0 && pin_number == pin
        puts "Withdrew #{amount}. New balance: $#{@balance - amount}."
      else pin_error
      end
    end 

    # Let users add money to their accounts
    def deposit(amount)
      puts amount > 0 ? "Deposited #{amount}. New balance: $#{@balance + amount}." : "Please enter a positive amount."
    end 
  
    private
    def pin
      @pin = 1234
    end
  
    def pin_error
      "Access denied: incorrect PIN."
    end
end

# Create CheckingAccounts that inherit from Account 
class CheckingAccounts < Account; end

# Create SavingsAccounts that inherit from Account 
class SavingsAccounts < Account
  # User to choose a saving term when open a savings account
  # Saving term must be at least 180 days
  def initialize(name, balance=100, saving_term=180)
    @name = name
    @balance = balance
    @saving_term = saving_term
  end
  
  # Interest is compounded every 30 days
  def interest_rate
    @interest_rate = random(0.01..0.5)
  end
  
  def deposit(d_time, d_amount)
    @d_time = Time.now
    @d_interest = @interest_rate
    puts "The current interest rate as of #{@d_time} is #{@d_interest}."
    puts "How much would you like to deposit?"
    @d_amount = gets.chomp.to_i
    puts @d_amount > 0 ? "Deposited #{@d_amount}. New balance: $#{@balance + @d_amount}." : "Please enter a positive amount."
  end

  def withdraw(w_time, pin_number, w_amount)
    @w_time = Time.now
    @w_interests = ((1 + @d_interest/100)^(@w_time - @d_time)/(60*60*24*30))*@d_amount
    if (@w_time - @d_time)/(60*60*24) >= @saving_term && pin_number == pin 
       puts "Interests as of #{@w_time} is #{@w_interests}."
       puts "Withdrew #{w_amount}. New balance: $#{@balance + @w_interests - @w_amount}."
    elsif (@W_time - @d_time)/(60*60*24) >= @saving_term && pin_number != pin
       puts "Penalty applied for early withdrawal. Continue? Y/N >> "
       # Penalty fee is 20% of expected interests at the time of withdrawal
       @response = gets.chomp
       @penalty = (@w_interests*20)/100
       puts "Withdrew #{w_amount}. New balance: $#{@balance + @w_interests - @w_amount - @penalty}."
    else puts pin_error 
    end
  end
end
  
  checking_account = CheckingAccounts.new("Sola", 5_000_000)
  checking_account.display_balance(1234)
  checking_account.withdraw(11, 200_000)
  checking_account.pin

  savings_account = SavingsAccounts.new("Sola", 500_000)
  savings_account.deposit(1234, 1000)

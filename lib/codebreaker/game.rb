module Codebreaker

  class Game

    HINTS = 3
    CODE_SIZE = 4
    ATTEMPTS = 5
    RANGE_NUMBER = 1..6  

    attr_accessor :secret_code, :user_code
    
    def initialize 
      @secret_code = secret_code
      @user_code = user_code
      @hint = HINTS  
    end

    def new_game
      start
      input_user_code
      attempts
      win?
    end  

    def start 
      @secret_code = Array.new(CODE_SIZE){rand(RANGE_NUMBER)}
    end

    def input_user_code
      @user_code = []
      puts "Enter your code numbers(only 1 to 6)"     
      CODE_SIZE.times do
      user_code << gets.chomp.to_i
      end
      user_code   
    end
   
    def count_plus
      plus = []
      CODE_SIZE.times do |i|
        if user_code[i] == secret_code[i]
            plus << "+"
        end
      end  
      plus        
    end

    def count_minus
      minus = []
      CODE_SIZE.times do |i|
        if user_code.include?(secret_code[i]) && user_code[i] != secret_code[i]
        minus << "-"
        end
      end
      minus
    end

    def count_plus_and_minus
      count = []
      count << count_plus.concat(count_minus).to_s
      puts count
    end

    def win?
      if (@secret_code - @user_code).empty?
        puts "Congratulation!You win"
      end
    end 

    def attempts
      ATTEMPTS.times do |i|
        unless @secret_code == @user_code   
        count_plus_and_minus
        input_user_code      
        end    
      end
    end

    def hint
      @hint -= 1
    end

    def take_hint!   
      random_hint = rand(CODE_SIZE)
      hint = secret_code[random_hint].to_s
      hint   
    end  
  end
end

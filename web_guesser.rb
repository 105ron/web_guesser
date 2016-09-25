require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
response = ''

get '/' do
	guess = params["guess"]
	response = check_guess(guess, number)
  erb :index, :locals => {:response => response}
end


def check_guess(guess, number)
	guess = guess.to_i unless guess == nil
	number = number.to_i
	if guess == nil
		return "Guess the number"
	elsif guess == number
		return "You got it. The number is #{guess}"
	elsif guess > (number + 5)
		return "#{guess} is way too high"
	elsif guess < (number - 5)
		return "#{guess} is way too low"
	elsif guess > number
		return "#{guess} is too high"
	elsif guess < number
		return "#{guess} is too low"
	end

end
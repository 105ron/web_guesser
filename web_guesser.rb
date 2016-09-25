require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
response = ''
color = 'blue'

get '/' do
	guess = params["guess"]
	response, color = check_guess(guess, number)
  erb :index, :locals => {:response => response, :color => color}
end


def check_guess(guess, number)
	guess = guess.to_i unless guess == nil
	number = number.to_i
	if guess == nil
		return "Guess the number", "blue"
	elsif guess == number
		return "You got it. The number is #{guess}", "green"
	elsif guess > (number + 5)
		return "#{guess} is way too high", "red"
	elsif guess < (number - 5)
		return "#{guess} is way too low", "red"
	elsif guess > number
		return "#{guess} is too high", "yellow"
	elsif guess < number
		return "#{guess} is too low", "yellow"
	end
end
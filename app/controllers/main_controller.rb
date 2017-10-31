class MainController < ApplicationController

  def try
    params[:number] = @guess unless params[:number] != nil
    cookies[:secret_number] = rand(1..100).to_i if cookies[:secret_number].nil?
    cookies[:counter] = 0 unless cookies[:counter] !=nil
    @guess = params[:number].to_i
    @secret_number = cookies[:secret_number].to_i
    if cookies[:counter].to_i+1 < 3
      if @guess > @secret_number
        @result = "You guessed too high!"
      elsif @guess < @secret_number
        @result = "You guessed too low!"
      end
      cookies[:counter] = cookies[:counter].to_i + 1
      if @guess == @secret_number
        @result = "You got it!"
      end
    else
      if @guess == @secret_number
        @result = "You got it!"
      else
        @result = "Sorry, out of tries!"
      end
      cookies[:secret_number] = rand(1..100).to_i
      cookies[:counter] = 0
    end

  end
end

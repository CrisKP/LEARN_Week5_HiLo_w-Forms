class MainController < ApplicationController

  def try
    params[:number] = @guess unless params[:number] != nil
    @guess = params[:number].to_i
    @secret_number = rand(1..100).to_i
    if @guess > @secret_number
      @result = "You guessed too high!"
    elsif @guess < @secret_number
      @result = "You guessed too low!"
    elsif @guess == @secret_number
      @result = "You got it!"
    end


  end
end

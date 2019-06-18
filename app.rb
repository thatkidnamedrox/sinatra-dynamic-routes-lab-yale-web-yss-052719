require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @number = params[:number]
    result = @number.to_i ** 2
    "#{result}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number]
    @phrase = params[:phrase]
    result = ""
    @number.to_i.times do |n|
      result += @phrase
    end
    result
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    result = []
    params.each do |key, value|
      result << value
    end
    result.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    operations = {
      add: lambda{|a,b| a + b },
      subtract: lambda{|a,b| a - b },
      multiply: lambda{|a,b| a * b },
      divide: lambda{|a,b| a / b } 
    }
    @op = params[:operation]
    @num1 = params[:number1]
    @num2 = params[:number2]
    operations[@op].call(@num1, @num2)
  end



end

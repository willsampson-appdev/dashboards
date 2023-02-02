class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    @at_hand = params.fetch("from_currency")
    render({ :template => "currency_templates/step_two.html.erb"})
  end

  def conversion
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    @at_hand = params.fetch("from_currency").to_s
    @go_to = params.fetch("to_currency").to_s
    @conversion_data = open("https://api.exchangerate.host/convert?from=#{@at_hand}&to=#{@go_to}").read
    @parsed_conversion = JSON.parse(@conversion_data) 
    @info_hash = @parsed_conversion.fetch("result")
    render({ :template => "currency_templates/final_step.html.erb"})
  end
end

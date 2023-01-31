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
    @at_hand = params.fetch("from_currency")
    @go_to = params.fetch("to_currency")
    # @raw_data = open("https://api.exchangerate.host/convert?from=#{@at_hand.to_s}%&to=#{@go_to.to_s}").read
    # @parsed_data = JSON.parse(@raw_data)
    # @symbols_hash = @parsed_data.fetch("")
    render({ :template => "currency_templates/final_step.html.erb"})
  end
end

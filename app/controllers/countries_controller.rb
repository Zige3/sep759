class CountriesController < ApplicationController
  def index
    @query = params[:looking_for].to_s
    @countries = CountryApi.search_by_name(@query)
  end

  def details
    @code = params[:code].to_s
    @country = CountryApi.find_by_code(@code)

    redirect_to root_path, alert: "Country not found." if @country.nil?
  end
end
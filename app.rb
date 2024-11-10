require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @num = params.fetch("number")
  @num_squared = @num.to_f**2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @num = params.fetch("user_number")
  @num_root = @num.to_f**(1/2.0)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_f

  monthly_rate = @apr/100/12
  monthly_periods = @years*12.0

  numer = monthly_rate * @pv
  denom = 1 - (1 + monthly_rate) ** (-monthly_periods)

  @payment = numer / denom

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @random_number = rand(@min..@max)

  erb(:random_results)
end

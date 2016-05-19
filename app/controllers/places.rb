class Makersbnb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  get '/places' do
    @places = Place.all
    erb :'places/index'
  end

  post '/places' do
    user = User.get(session[:user_id])
    date_obj = Date.parse(params[:availability])
    place = Place.create(
      name: params[:name],
      description: params[:description],
      price: params[:price].to_i,
      user_id: user.id,
      username: user.username)
    availability = Availability.create(
      start_date: date_obj,
      place_id: place.id)
    redirect '/places'
  end

  get '/places/manage' do
    @places = Place.all(user_id: params[:id])
    erb :'places/manage'
  end



end

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
    place = Place.create(
      name: params[:name],
      description: params[:description],
      price: params[:price].to_i,
      user_id: user.id)
    redirect '/places'
  end

  post '/places/bookings' do
    id = params[:id]
    redirect 'places/bookings/' + id
  end

  get '/places/bookings/:id' do
    @place = Place.get(params['id'])
    @place.update(booked: true)
    erb :'places/bookings'
  end

end

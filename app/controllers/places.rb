class Makersbnb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  get '/places' do
    @place = Place.first
    erb :'places/places'
  end

  post '/places' do
    user = User.get(session[:user_id])
    Place.create(
      name: params[:name],
      description: params[:description],
      price: params[:price].to_i,
      user_id: user.id)
    redirect '/places'
  end

  get 'places/id' do
    @place = Place.get(id)
    erb :'places/booked'
  end

  post 'places/:id' do
    id = params[:id]
    redirect '/places'
  end

end

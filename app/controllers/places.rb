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
      user_id: user.id,
      username: user.username)
    redirect '/places'
  end

end

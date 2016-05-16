class Makersbnb < Sinatra::Base

  get '/places/new' do
    erb :'places/new'
  end

  get '/places' do
    erb :'places'
  end

  post '/places' do
    Place.create(
      name: params[:name],
      description: params[:description],
      price: params[:price])
    redirect '/places'
  end

end

class Makersbnb < Sinatra::Base

  post '/requests/new' do
    id = params[:id]
    Request.create(user_id: session[:user_id], place_id: id)
    redirect 'requests/new' + id
  end

  get '/requests/new:id' do
    @place = Place.get(params['id'])
    @place.update(booked: true)
    erb :'requests/new'
  end

end

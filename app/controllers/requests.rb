class Makersbnb < Sinatra::Base

  post '/requests/new' do
    id = params[:id]
    username = params[:username]
    Request.create(user_id: session[:user_id], place_id: id, host: username)
    redirect 'requests/new' + id
  end

  get '/requests/new:id' do
    @place = Place.get(params['id'])
    @place.update(booked: true)
    erb :'requests/new'
  end

  post '/requests/sent' do
    id = params[:id]
    redirect 'requests/sent' + id
  end

  get '/requests/sent:id' do
    @sent = Request.all(user_id: params['id'])
    erb :'requests/sent'
  end

  post '/requests/received' do
    username = params[:username]
    redirect 'requests/received' + username
  end

  get '/requests/received:username' do
    @received = Request.all(host: params['username'])
    erb :'requests/received'
  end

end

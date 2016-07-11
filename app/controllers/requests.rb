class Makersbnb < Sinatra::Base

  post '/requests/new' do
    id = params[:id]
    username = params[:username]
    Request.create(user_id: session[:user_id], place_id: id, host: username)
    redirect 'requests/new' + id
  end

  get '/requests/new:id' do
    @place = Place.get(params['id'])
    erb :'requests/new'
  end

  # post '/requests/sent' do
  #   id = params[:id]
  #   redirect 'requests/sent' + id
  # end

  get '/requests/sent' do
    @sent = Request.all(user_id: current_user.id)
    erb :'requests/sent'
  end

  # post '/requests/received' do
  #   username = params[:username]
  #   redirect 'requests/received' + username
  # end

  get '/requests/received' do
    @received = Request.all(host: current_user.username)
    erb :'requests/received'
  end

  post '/requests/accepted' do
    username = current_user.username
    request = Request.get(params[:request])
    place = Place.get(params[:place])
    request.update(approved: true)
    place.update(booked: true)
    redirect '/requests/received'
  end

  post '/requests/declined' do
    username = current_user.username
    request = Request.get(params[:request])
    request.update(declined: true)
    redirect 'requests/received'
  end

end

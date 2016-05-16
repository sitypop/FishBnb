class Makersbnb < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                confirm_password: params[:confirm_password]
                )
    redirect '/'
  end

end

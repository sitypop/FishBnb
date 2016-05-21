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
    start_date_obj = convert_date_object(params[:start_date])
    end_date_obj = convert_date_object(params[:end_date])
    place = create_place(user)
    availability = create_availability(place.id, start_date_obj, end_date_obj)
    redirect '/places'
  end

  get '/places/manage' do
    @places = Place.all(user_id: params[:id])
    erb :'places/manage'
  end

  get '/places/manage/availability' do
    @place = Place.first(params[:id])
    @availabilities = Availability.all(:place_id => @place.id)
    erb :'places/manage_availability'
  end

  post '/places/manage/availability' do
    start_date_obj = convert_date_object(params[:start_date])
    end_date_obj = convert_date_object(params[:end_date])
    availability = create_availability(params[:id], start_date_obj, end_date_obj)
    redirect '/places/manage/availability'
  end

end

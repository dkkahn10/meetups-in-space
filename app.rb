require 'sinatra'
require_relative 'config/application'
require 'pry'

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:name)
  erb :'meetups/index'
end

get '/meetups/new' do
  @error = nil
  if session[:user_id] == nil
    @error = "Error! Please sign in!"
    @meetups = Meetup.order(:name)
    erb :'meetups/index'
  else
    erb :'meetups/new'
  end
end

post '/meetups/new' do
  @name = params[:name]
  @location = params[:location]
  @description = params[:description]
  @error = nil

  if @name.strip == '' || @location.strip == '' || @description.strip == ''
    @error = "Please fill out all forms...Or else 🍟"
  else
    success_meet = Meetup.create(name: "#{@name}", location: "#{@location}", description: "@description" )
    redirect '/meetups/#{@success_meet.id}'
  end
  erb :'messages/new'
end

get '/meetups/:id' do
  id = params[:id]
  @info = Meetup.find(id)

  erb :'meetups/show'
end

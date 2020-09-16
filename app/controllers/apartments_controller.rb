class ApartmentsController < ApplicationController
  set :views, "app/views/apartments"

  get "/" do
    erb :welcome
  end
  
  get '/apartments' do
    @apartments = Apartment.all
    erb :index
  end

  get '/apartments/new' do
    erb :new
  end
  
  post '/apartments' do
    Apartment.create(params)
    redirect "/apartments"
  end
  
  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    @tenants = Tenant.where("apartment_id == #{@apartment.id}")
    erb :show
  end

  delete "/apartments/:id" do
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect "/apartments"
  end
  
end

class TenantsController < ApplicationController
  set :views, "app/views/tenants"

  get "/tenants" do
    @tenants = Tenant.all
    erb :index
  end

  get "/tenants/new" do
    erb :new
  end

  post "/tenants" do
    Tenant.create(params)
    redirect "/tenants"
  end

  get "/tenants/:id" do
    @tenant = Tenant.find(params[:id])
    erb :show
  end

  get "/tenants/:id/edit" do
    @tenant = Tenant.find(params[:id])
    @apartment = Apartment.find(@tenant.apartment_id)
    erb :edit
  end

  patch "/tenants/:id" do
    @tenant = Tenant.find(params[:id])
    @tenant.update(params[:tenant])
    redirect "/tenants/#{@tenant.id}"
  end

  delete "/tenants/:id" do
    @tenant = Tenant.find(params[:id])
    @tenant.destroy
    redirect "/tenants"
  end
end

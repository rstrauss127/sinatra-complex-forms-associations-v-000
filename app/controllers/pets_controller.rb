class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(name: params["pet"]["name"])
    owner = Owner.find_by_id(params["pet"]["owner_id"])
    @pet.owner = owner
    if !params["pet"]["owner_name"].empty?
      @pet.owner = Owner.create(name: params["pet"]["owner_name"])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    erb :'pets/edit'
  end

  post '/pets/:id' do
    puts params
  #Sbinding.pry
    @pet = Pet.find(params[:id])
    if !params["pet_name"].empty?
      @pet.name = params["pet_name"]
    end

    
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end

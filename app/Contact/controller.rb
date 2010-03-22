require 'rho/rhocontroller'
require 'rho/rhocontact'

class ContactController < Rho::RhoController

  #GET /Contact
  def index
    @contacts = Rho::RhoContact.find(:all)
    @contacts.to_a.sort! {|x,y| x[1]['first_name'] <=> y[1]['first_name'] } if @contacts
  end

  # GET /Contact/{1}
  def show
    @contact = Rho::RhoContact.find(@params['id'])
  end

  # GET /Contact/new
  def new
  end

  # GET /Contact/{1}/edit
  def edit
    @contact = Rho::RhoContact.find(@params['id'])
  end

  # POST /Contact/create
  def create
    @contact = Rho::RhoContact.create!(@params['contact'])
    redirect :action => :index
  end

  # POST /Contact/{1}/update
  def update
    Rho::RhoContact.update_attributes(@params['contact'])
    redirect :action => :index
  end

  # POST /Contact/{1}/delete
  def delete
    Rho::RhoContact.destroy(@params['id'])
    redirect :action => :index
  end
end

module Expedientes
  class ProfesionalsController < ApplicationController
    load_and_authorize_resource(:class =>"Expedientes::Profesional")
    # GET /profesionals
    # GET /profesionals.json
    def index
      @search = Profesional.search(params[:search])
      @profesionals = @search.page(params[:page])      
  
      respond_to do |format|
        format.html {

        }
        format.json {

          render json: @profesionals, :methods => :name 
        }
      end
    end
  
    # GET /profesionals/1
    # GET /profesionals/1.json
    def show
      @profesional = Profesional.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @profesional }
      end
    end
  
    # GET /profesionals/new
    # GET /profesionals/new.json
    def new
      @profesional = Profesional.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profesional }
      end
    end
  
    # GET /profesionals/1/edit
    def edit
      @profesional = Profesional.find(params[:id])
    end
  
    # POST /profesionals
    # POST /profesionals.json
    def create
      @profesional = Profesional.new(params[:profesional])
  
      respond_to do |format|
        if @profesional.save
          format.html { redirect_to @profesional, notice: 'Profesional was successfully created.' }
          format.json { render json: @profesional, status: :created, location: @profesional }
        else
          format.html { render action: "new" }
          format.json { render json: @profesional.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /profesionals/1
    # PUT /profesionals/1.json
    def update
      @profesional = Profesional.find(params[:id])
  
      respond_to do |format|
        if @profesional.update_attributes(params[:profesional])
          format.html { redirect_to @profesional, notice: 'Profesional was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @profesional.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /profesionals/1
    # DELETE /profesionals/1.json
    def destroy
      @profesional = Profesional.find(params[:id])
      @profesional.destroy
  
      respond_to do |format|
        format.html { redirect_to profesionals_url }
        format.json { head :ok }
      end
    end
  end
end

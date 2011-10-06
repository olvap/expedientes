module Personas
  class SexosController < ApplicationController
    # GET /sexos
    # GET /sexos.json
    def index
      @sexos = Sexo.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @sexos }
      end
    end
  
    # GET /sexos/1
    # GET /sexos/1.json
    def show
      @sexo = Sexo.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @sexo }
      end
    end
  
    # GET /sexos/new
    # GET /sexos/new.json
    def new
      @sexo = Sexo.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @sexo }
      end
    end
  
    # GET /sexos/1/edit
    def edit
      @sexo = Sexo.find(params[:id])
    end
  
    # POST /sexos
    # POST /sexos.json
    def create
      @sexo = Sexo.new(params[:sexo])
  
      respond_to do |format|
        if @sexo.save
          format.html { redirect_to @sexo, notice: 'Sexo was successfully created.' }
          format.json { render json: @sexo, status: :created, location: @sexo }
        else
          format.html { render action: "new" }
          format.json { render json: @sexo.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /sexos/1
    # PUT /sexos/1.json
    def update
      @sexo = Sexo.find(params[:id])
  
      respond_to do |format|
        if @sexo.update_attributes(params[:sexo])
          format.html { redirect_to @sexo, notice: 'Sexo was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @sexo.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /sexos/1
    # DELETE /sexos/1.json
    def destroy
      @sexo = Sexo.find(params[:id])
      @sexo.destroy
  
      respond_to do |format|
        format.html { redirect_to sexos_url }
        format.json { head :ok }
      end
    end
  end
end

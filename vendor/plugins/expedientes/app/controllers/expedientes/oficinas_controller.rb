module Expedientes
  class OficinasController < ApplicationController
   load_and_authorize_resource(:class =>"Expedientes::Oficina")
    # GET /oficinas
    # GET /oficinas.json
    def index
      @search = Oficina.search(params[:search])
      @oficinas = @search.page(params[:page])
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @oficinas }
      end
    end
  
    # GET /oficinas/1
    # GET /oficinas/1.json
    def show
      @oficina = Oficina.find(params[:id])
      @search = Expediente.search(:pase_oficina_id_eq => params[:id])
      @expedientes = @search.page(params[:page])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @oficina }
      end
    end
  
    # GET /oficinas/new
    # GET /oficinas/new.json
    def new
      @oficina = Oficina.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @oficina }
      end
    end
  
    # GET /oficinas/1/edit
    def edit
      @oficina = Oficina.find(params[:id])
    end
  
    # POST /oficinas
    # POST /oficinas.json
    def create
      @oficina = Oficina.new(params[:oficina])
  
      respond_to do |format|
        if @oficina.save
          format.html { redirect_to @oficina, notice: 'Oficina was successfully created.' }
          format.json { render json: @oficina, status: :created, location: @oficina }
        else
          format.html { render action: "new" }
          format.json { render json: @oficina.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /oficinas/1
    # PUT /oficinas/1.json
    def update
      @oficina = Oficina.find(params[:id])
  
      respond_to do |format|
        if @oficina.update_attributes(params[:oficina])
          format.html { redirect_to @oficina, notice: 'Oficina was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @oficina.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /oficinas/1
    # DELETE /oficinas/1.json
    def destroy
      @oficina = Oficina.find(params[:id])
      @oficina.destroy
  
      respond_to do |format|
        format.html { redirect_to oficinas_url }
        format.json { head :ok }
      end
    end
  end
end

module Expedientes
  class ExpedientesController < ApplicationController
    #load_and_authorize_resource(:class =>"Expedientes::Expediente")
    # GET /expedientes
    # GET /expedientes.json
    def index
      @search = Expediente.search(params[:search])
      @expedientes = @search.page(params[:page])
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @expedientes }
      end
    end
  
    # GET /expedientes/1
    # GET /expedientes/1.json
    def show
      @expediente = Expediente.find(params[:id])
      @pases = @expediente.pases
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @expediente }
      end
    end
  
    # GET /expedientes/new
    # GET /expedientes/new.json
    def new
      @expediente = Expediente.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @expediente }
      end
    end
  
    # GET /expedientes/1/edit
    def edit
      @expediente = Expediente.find(params[:id])
    end
  
    # POST /expedientes
    # POST /expedientes.json
    def create
      @expediente = Expediente.new(params[:expediente])
  
      respond_to do |format|
        if @expediente.save
          format.html { redirect_to new_expediente_pase_path(@expediente), notice: 'Expediente was successfully created.' }
          format.json { render json: @expediente, status: :created, location: @expediente }
        else
          format.html { render action: "new" }
          format.json { render json: @expediente.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /expedientes/1
    # PUT /expedientes/1.json
    def update
      @expediente = Expediente.find(params[:id])
  
      respond_to do |format|
        if @expediente.update_attributes(params[:expediente])
          format.html { redirect_to @expediente, notice: 'Expediente was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @expediente.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /expedientes/1
    # DELETE /expedientes/1.json
    def destroy
      @expediente = Expediente.find(params[:id])
      @expediente.destroy
  
      respond_to do |format|
        format.html { redirect_to expedientes_url }
        format.json { head :ok }
      end
    end
  end
end

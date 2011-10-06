module Expedientes
  class PasesController < ApplicationController
    load_and_authorize_resource(:class =>"Expedientes::Pase")
    # GET /pases
    # GET /pases.json
    def index
      @search = Pase.search(params[:search])
      @pases = @search.where(:expediente_id => params[:expediente_id]).page(params[:page])
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pases }
      end
    end
  
    # GET /pases/1
    # GET /pases/1.json
    def show
      @pase = Pase.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @pase }
      end
    end
  
    # GET /pases/new
    # GET /pases/new.json
    def new
      @pase = Pase.new
      @pase.expediente_id = params[:expediente_id]
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @pase }
      end
    end
  
    # GET /pases/1/edit
    def edit
      @pase = Pase.find(params[:id])
    end
  
    # POST /pases
    # POST /pases.json
    def create
      @pase = Pase.new(params[:pase])
  
      respond_to do |format|
        if @pase.save
          expediente = @pase.expediente
          expediente.pase = @pase
          expediente.save  
          format.html { redirect_to xpedientes.expediente_path(@pase.expediente), notice: 'Pase was successfully created.' }
          format.json { render json: @pase, status: :created, location: @pase }
        else
          format.html { render action: "new" }
          format.json { render json: @pase.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /pases/1
    # PUT /pases/1.json
    def update
      @pase = Pase.find(params[:id])
  
      respond_to do |format|
        if @pase.update_attributes(params[:pase])
          format.html { redirect_to @pase, notice: 'Pase was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @pase.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /pases/1
    # DELETE /pases/1.json
    def destroy
      @pase = Pase.find(params[:id])
      @pase.destroy
  
      respond_to do |format|
        format.html { redirect_to @pase.expediente }
        format.json { head :ok }
      end
    end
  end
end

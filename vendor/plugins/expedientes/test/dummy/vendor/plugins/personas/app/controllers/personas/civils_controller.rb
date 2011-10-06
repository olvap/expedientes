module Personas
  class CivilsController < ApplicationController
    # GET /civils
    # GET /civils.json
    def index
      @search = Civil.search(params[:search])
      @civils = @search.page(params[:page])
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @civils }
      end
    end
  
    # GET /civils/1
    # GET /civils/1.json
    def show
      @civil = Civil.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @civil }
      end
    end
  
    # GET /civils/new
    # GET /civils/new.json
    def new
      @civil = Civil.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @civil }
      end
    end
  
    # GET /civils/1/edit
    def edit
      @civil = Civil.find(params[:id])
    end
  
    # POST /civils
    # POST /civils.json
    def create
      @civil = Civil.new(params[:civil])
  
      respond_to do |format|
        if @civil.save
          format.html { redirect_to @civil, notice: 'Civil was successfully created.' }
          format.json { render json: @civil, status: :created, location: @civil }
        else
          format.html { render action: "new" }
          format.json { render json: @civil.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /civils/1
    # PUT /civils/1.json
    def update
      @civil = Civil.find(params[:id])
  
      respond_to do |format|
        if @civil.update_attributes(params[:civil])
          format.html { redirect_to @civil, notice: 'Civil was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @civil.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /civils/1
    # DELETE /civils/1.json
    def destroy
      @civil = Civil.find(params[:id])
      @civil.destroy
  
      respond_to do |format|
        format.html { redirect_to civils_url }
        format.json { head :ok }
      end
    end
  end
end

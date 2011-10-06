module Personas
  class TaddressesController < ApplicationController
    # GET /taddresses
    # GET /taddresses.json
    def index
      @taddresses = Taddress.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @taddresses }
      end
    end
  
    # GET /taddresses/1
    # GET /taddresses/1.json
    def show
      @taddress = Taddress.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @taddress }
      end
    end
  
    # GET /taddresses/new
    # GET /taddresses/new.json
    def new
      @taddress = Taddress.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @taddress }
      end
    end
  
    # GET /taddresses/1/edit
    def edit
      @taddress = Taddress.find(params[:id])
    end
  
    # POST /taddresses
    # POST /taddresses.json
    def create
      @taddress = Taddress.new(params[:taddress])
  
      respond_to do |format|
        if @taddress.save
          format.html { redirect_to @taddress, notice: 'Taddress was successfully created.' }
          format.json { render json: @taddress, status: :created, location: @taddress }
        else
          format.html { render action: "new" }
          format.json { render json: @taddress.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /taddresses/1
    # PUT /taddresses/1.json
    def update
      @taddress = Taddress.find(params[:id])
  
      respond_to do |format|
        if @taddress.update_attributes(params[:taddress])
          format.html { redirect_to @taddress, notice: 'Taddress was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @taddress.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /taddresses/1
    # DELETE /taddresses/1.json
    def destroy
      @taddress = Taddress.find(params[:id])
      @taddress.destroy
  
      respond_to do |format|
        format.html { redirect_to taddresses_url }
        format.json { head :ok }
      end
    end
  end
end

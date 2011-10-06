module Personas
  class TdocsController < ApplicationController
    # GET /tdocs
    # GET /tdocs.json
    def index
      @tdocs = Tdoc.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tdocs }
      end
    end
  
    # GET /tdocs/1
    # GET /tdocs/1.json
    def show
      @tdoc = Tdoc.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @tdoc }
      end
    end
  
    # GET /tdocs/new
    # GET /tdocs/new.json
    def new
      @tdoc = Tdoc.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @tdoc }
      end
    end
  
    # GET /tdocs/1/edit
    def edit
      @tdoc = Tdoc.find(params[:id])
    end
  
    # POST /tdocs
    # POST /tdocs.json
    def create
      @tdoc = Tdoc.new(params[:tdoc])
  
      respond_to do |format|
        if @tdoc.save
          format.html { redirect_to @tdoc, notice: 'Tdoc was successfully created.' }
          format.json { render json: @tdoc, status: :created, location: @tdoc }
        else
          format.html { render action: "new" }
          format.json { render json: @tdoc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /tdocs/1
    # PUT /tdocs/1.json
    def update
      @tdoc = Tdoc.find(params[:id])
  
      respond_to do |format|
        if @tdoc.update_attributes(params[:tdoc])
          format.html { redirect_to @tdoc, notice: 'Tdoc was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @tdoc.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /tdocs/1
    # DELETE /tdocs/1.json
    def destroy
      @tdoc = Tdoc.find(params[:id])
      @tdoc.destroy
  
      respond_to do |format|
        format.html { redirect_to tdocs_url }
        format.json { head :ok }
      end
    end
  end
end

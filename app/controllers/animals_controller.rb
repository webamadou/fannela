class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @animal = Animal.new(params[:animal].permit(:title, :description))
    if @animal.save
      render partial: "animal", locals: {animal: @animal}
    end
  end

  def destroy
    @animal = Animal.find params[:id]
    @animal.destroy
    render json: @animal
  end

end
class TextbooksController < ApplicationController
  before_action :set_textbook, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show,]

  def index
    @textbooks = Textbook.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @textbook = current_user.textbooks.build
  end

  def edit
  end

  def create
    @textbook = current_user.textbooks.build(textbook_params)
    if @textbook.save
      redirect_to @textbook, notice: 'Textbook was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @textbook.update(textbook_params)
      redirect_to @textbook, notice: 'Textbook was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @textbook.destroy
    redirect_to textbooks_url, notice: 'Textbook was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_textbook
      @textbook = Textbook.find(params[:id])
    end

    def correct_user
      @textbook = current_user.textbooks.find_by(id: params[:id])
      redirect_to textbooks_path, notice: "This is not your textbook!" if @textbook.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def textbook_params
      params.require(:textbook).permit(:Title, :Description, :image)
    end
end

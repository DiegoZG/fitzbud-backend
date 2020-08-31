class FoodsController < ApplicationController
before_action :find_food, only: [:edit, :update, :destroy, :show]
before_action :authenticate_user,  except: [:index, :show]

    food = Food.new(food_params)
    # food.user = @api_user
    food.user = User.last
    if food.save
      render json: { id: food.id, status: :success }
    else
      render json: { status: :failure, errors: food.errors.full_messages }
    end
  end

  def index
    @foods = Food.order(created_at: :desc)
    render json: @foods
  end


  def show
    food = Food.find params[:id]
    render json: food
  end

  def edit
    @category = Category.all
  end

  def update
    @food = Food.find params[:id]
    if @food.update food_params
      render json: @food
    else
      flash.now[:alert] = 'Please see errors below!'
    end
  end

  def destroy
    @food = Food.find params[:id]
    @food.destroy
  end

  private
  def food_params
    params.require(:food).permit(:title, :calories, 
                                :macro_group, 
                                :date,
                                :category_id)
  end





#   def new
#     @food = Food.new
#     @category = Category.all
#   end

#   def create
#     @food = Food.new food_params
#     @food.user = current_user
#     if @food.save
#       flash[:notice] = 'Food Created'
#       redirect_to food_path(@food)
#     else
#       flash.now[:alert] = 'Please see errors below'
#       render :new
#     end
#   end

#   def index
#   @foods = current_user.foods
#   respond_to do |format|
#     format.html { render }
#     format.text { render }
#     format.xml  { render xml: @food }
#     format.json { render json: @food.to_json}
#   end
# end

# def edit
#   @category = Category.all
# end

# def update
#   if @food.update food_params
#     flash[:notice] = 'Food updated'
#     redirect_to food_path(@food)
#   else
#     flash.now[:alert] = 'Please see errors below!'
#     render :edit
#   end
# end

# def show
#   respond_to do |format|
#     format.html { render }
#     format.text { render }
#     format.xml  { render xml: @food }
#     format.json { render json: @food.to_json(include: :categories)  }
#   end
# end

# def destroy
#   @food.destroy
#   redirect_to foods_path, notice: 'Food Deleted'
# end

#   private

#   def food_params
#     params.require(:food).permit([:title,:calories,:category_id, :macro_group, :date])
#   end

#   def find_food
#     @food = Food.find params[:id]
#   end


end

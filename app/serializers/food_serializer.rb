class FoodSerializer < ActiveModel::Serializer
  attributes :id, :title, :calories, :macro_group, :date, :category_id, :user_id
end

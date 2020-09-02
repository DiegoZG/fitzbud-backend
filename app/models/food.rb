class Food < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false, message: "must be unique"}

    validates :calories, presence: true
    belongs_to :category
    belongs_to :user

    def user_name
        if user
            user.name
        else
            'Anonymous'
        end
    end

private

def titleize_name
    self.name = name.titleize if name.present?
end




end

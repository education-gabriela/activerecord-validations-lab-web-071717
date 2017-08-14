class Post < ActiveRecord::Base
  validates :title, {presence: true}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :is_click_baity

  def is_click_baity
    phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    valid_title = true
    # binding.pry

    if !title.nil? && !title.empty?
      valid_title = phrases.any? do |phrase|
        title.include?(phrase)
      end
    end

    if !valid_title
      errors.add :title, "is not click-baity"
    end
  end
end

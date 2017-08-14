class Post < ActiveRecord::Base
  validates :title, {presence: true}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :is_click_baity

  def is_click_baity
    phrases = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]

    if !phrases.any? {|phrase| phrase.match(title)}
      errors.add :title, "is not click-baity"
    end
  end
end

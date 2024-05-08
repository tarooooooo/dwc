class Book < ApplicationRecord
  is_impressionable
  belongs_to :user
  has_many :favorites,        dependent: :destroy
  has_many :favorited_users , through: :favorites, source: :user
  has_many :book_comments,    dependent: :destroy
  belongs_to :category
  has_many :tag_books, dependent: :destroy
  has_many :tags, through: :tag_books

  validates :title , presence: true
  validates :body ,  length: {maximum: 200}, presence: true

  validates :rate, presence: true
  validates :rate, numericality: {
    # only_integer: true,
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5,
  }

  scope :created_at_today,          -> { where(created_at: Time.zone.now.all_day) }
  scope :created_at_yesterday,      -> { where(created_at: 1.day.ago.all_day) }
  scope :created_at_two_days_ago  , -> { where(created_at: 2.day.ago.all_day) }
  scope :created_at_three_days_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_at_four_days_ago,  -> { where(created_at: 4.day.ago.all_day) }
  scope :created_at_five_days_ago , -> { where(created_at: 5.day.ago.all_day) }
  scope :created_at_six_days_ago,   -> { where(created_at: 6.day.ago.all_day) }
  scope :created_at_week,           -> {where(created_at: 1.week.ago.end_of_day...Time.current.end_of_day) }
  scope :created_at_last_week,      -> {where(created_at: 2.week.ago.end_of_day...1.week.ago.end_of_day) }

  def save_tags(tag_names)
    tag_names.each do |new_tag_name|
      tags.find_or_create_by(name: new_tag_name)
    end
  end

  def self.looks(searches,words)
    if searches == "perfect_match"
      @book = Book.where("title LIKE ?" , "#{words}")
      @book = Book.where("body LIKE ?" , "#{words}")
    elsif searches == "forword_match"
      @book = Book.where("title LIKE ?" , "#{words}%")
      @book = Book.where("body LIKE ?" , "#{words}%")
    elsif searches == "backword_match"
      @book = Book.where("title LIKE ?" , "%#{words}")
      @book = Book.where("body LIKE ?" , "%#{words}")
    else
      @book = Book.where("title LIKE ?" , "%#{words}%")
      @book = Book.where("body LIKE ?" , "%#{words}%")
    end
  end

  def self.category_looks(words)
    @category = Category.where('name LIKE ?', "#{words}")
  end

end

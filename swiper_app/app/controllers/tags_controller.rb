class TagsController < ApplicationController
  def search
    @word = params[:word]
    @books = Book.joins(:tags).where("tags.name LIKE ?", "%#{@word}%")
  end
end

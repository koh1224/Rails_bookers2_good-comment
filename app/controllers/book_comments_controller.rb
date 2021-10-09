class BookCommentsController < ApplicationController

  def create
    @bookfind = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @bookfind.id
    @comment.save
    render :create
  end

  def destroy
    @bookfind = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
    render :destroy
  end

private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end

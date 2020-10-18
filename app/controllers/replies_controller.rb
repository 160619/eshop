# frozen_string_literal: true

# RepliesController
class RepliesController < ApplicationController
  before_action :find_review, only: [:create]

  def new
    @review = Review.find(params[:review_id])
    @reply = @review.replies.new
  end

  def create
    @reply = @review.replies.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.js
        format.json { render json: @reply, status: :created, location: @user }
      else
        format.json { render json: @reply.errors, status: :unprocessable_emtity }
      end
    end
  end

  def show
    @reply = Reply.find(params[:id])
    @review = @reply.review
  end

  private

  def reply_params
    params.require(:reply).permit(:review_id, :comment).merge!(user_id: current_user.id)
  end

  def find_review
    @review = Review.find(params[:review_id])
  end
end

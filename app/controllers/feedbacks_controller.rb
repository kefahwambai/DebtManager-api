class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :update, :destroy]

  # respond_to :json

  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  def show
    respond_with(@feedback)
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save
    respond_with(@feedback)
  end

  def update
    @feedback.update(feedback_params)
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback)
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.permit(:name, :email, :message)
    end
end

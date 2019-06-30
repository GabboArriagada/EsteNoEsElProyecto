class AnswersController < ApplicationController
before_action :authenticate_user!
  def create
    @question       = Question.find(params[:question_id])
    @answer         = @question.answers.build(answers_params)
    @answer.user    = current_user
    @answer.save

    redirect_to tema_path(@question.tema_id)
  end

  def destroy
    @question       =  Question.find(params[:question_id])
    @answer         =  @question.answers.find(params[:id]).destroy
    redirect_to tema_path(params[:id])
  end

  private
    def answers_params
      params.require(:answer).permit(:content)
    end

end

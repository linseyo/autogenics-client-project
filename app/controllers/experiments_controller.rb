class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.all
  end

  def show
    @experiment = Experiment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new( title: experiment_params[:title],
                                  abstract: experiment_params[:abstract],
                                  introduction: experiment_params[:introduction],
                                  materials: experiment_params[:materials],
                                  results: experiment_params[:results],
                                  discussion: experiment_params[:discussion],
                                  conclusion: experiment_params[:conclusion],
                                  supporting_info: experiment_params[:supporting_info],
                                  acknowledgments: experiment_params[:acknowledgments],
                                  references: experiment_params[:references],
                                  author_contributions: experiment_params[:author_contributions],
                                  author_id: session[:user_id],
                                  staff_size: experiment_params[:staff_size])
    @experiment.save
    redirect_to @experiment
  end

  private
    def experiment_params
       params.require(:experiment).permit(:title, :abstract, :introduction, :materials, :results, :discussion, :conclusion, :supporting_info, :acknowledgments, :author_contributions, :references, :staff_size)
    end

end

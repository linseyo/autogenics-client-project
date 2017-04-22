class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.order(created_at: :desc)
  end

  def show
    @user = User.find(session[:user_id])
    @experiment = Experiment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @experiment = Experiment.new
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def create
    @experiment = Experiment.create!( title: experiment_params[:title],
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
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @lab_staff = User.find(session[:user_id])
    @experiment = Experiment.find(params[:id])
    if @experiment.staff.length < 6
      @experiment.staff << @lab_staff
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private
    def experiment_params
       params.require(:experiment).permit(:title, :abstract, :introduction, :materials, :results, :discussion, :conclusion, :supporting_info, :acknowledgments, :author_contributions, :references, :staff_size)
    end

end

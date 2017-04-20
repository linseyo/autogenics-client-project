class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
  end


  def show
    @experiment = Experiment.find(params[:id])
  end



  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.save
    redirect_to @experiment
  end



  private
    def experiment_params
       params.require(:article).permit(:title, :abstract, :introduction, :materials, :results, :discussion, :conclusion, :supporting_info, :acknowledgments, :author_contributions, :references, :staff_size)
    end

end

class ReportGroupsController < ApplicationController
  before_action :set_report_group, only: [:show, :edit, :update, :destroy]

  # GET /report_groups
  # GET /report_groups.json
  def index
    @report_groups = ReportGroup.all
  end

  # GET /report_groups/1
  # GET /report_groups/1.json
  def show
    @contents = @report_group.reports
  end

  # GET /report_groups/new
  def new
    @report_group = ReportGroup.new
  end

  # GET /report_groups/1/edit
  def edit
  end

  # POST /report_groups/redo_groups
  def redo_groups
    flash[:notice] = 'Generation is starting momentarily. Old groups will be cleared.'
    FindClustersJob.perform_later
    redirect_to report_groups_path
  end

  # POST /report_groups
  # POST /report_groups.json
  def create
    @report_group = ReportGroup.new(report_group_params)

    respond_to do |format|
      if @report_group.save
        format.html { redirect_to @report_group, notice: 'Report group was successfully created.' }
        format.json { render :show, status: :created, location: @report_group }
      else
        format.html { render :new }
        format.json { render json: @report_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_groups/1
  # PATCH/PUT /report_groups/1.json
  def update
    respond_to do |format|
      if @report_group.update(report_group_params)
        format.html { redirect_to @report_group, notice: 'Report group was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_group }
      else
        format.html { render :edit }
        format.json { render json: @report_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_groups/1
  # DELETE /report_groups/1.json
  def destroy
    @report_group.destroy
    respond_to do |format|
      format.html { redirect_to report_groups_url, notice: 'Report group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_group
      @report_group = ReportGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_group_params
      params.require(:report_group).permit(:name)
    end
end

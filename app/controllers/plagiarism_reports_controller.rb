class PlagiarismReportsController < ApplicationController
  before_action :set_plagiarism_report, only: %i[ show edit update destroy ]

  # GET /plagiarism_reports or /plagiarism_reports.json
  def index
    @plagiarism_reports = PlagiarismReport.all
  end

  # GET /plagiarism_reports/1 or /plagiarism_reports/1.json
  def show
  end

  # GET /plagiarism_reports/new
  def new
    @plagiarism_report = PlagiarismReport.new
  end

  # GET /plagiarism_reports/1/edit
  def edit
  end

  # POST /plagiarism_reports or /plagiarism_reports.json
  def create
    @plagiarism_report = PlagiarismReport.new(plagiarism_report_params)

    respond_to do |format|
      if @plagiarism_report.save
        format.html { redirect_to @plagiarism_report, notice: "Plagiarism report was successfully created." }
        format.json { render :show, status: :created, location: @plagiarism_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plagiarism_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plagiarism_reports/1 or /plagiarism_reports/1.json
  def update
    respond_to do |format|
      if @plagiarism_report.update(plagiarism_report_params)
        format.html { redirect_to @plagiarism_report, notice: "Plagiarism report was successfully updated." }
        format.json { render :show, status: :ok, location: @plagiarism_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plagiarism_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plagiarism_reports/1 or /plagiarism_reports/1.json
  def destroy
    @plagiarism_report.destroy!

    respond_to do |format|
      format.html { redirect_to plagiarism_reports_path, status: :see_other, notice: "Plagiarism report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plagiarism_report
      @plagiarism_report = PlagiarismReport.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def plagiarism_report_params
      params.expect(plagiarism_report: [ :assignment_submission_id, :similarity_score, :sources_list, :date_generated ])
    end
end

class ClassCohortsController < ApplicationController
  before_action :set_class_cohort, only: %i[ show edit update destroy ]

  # GET /class_cohorts or /class_cohorts.json
  def index
    @class_cohorts = ClassCohort.all
  end

  # GET /class_cohorts/1 or /class_cohorts/1.json
  def show
  end

  # GET /class_cohorts/new
  def new
    @class_cohort = ClassCohort.new
  end

  # GET /class_cohorts/1/edit
  def edit
  end

  # POST /class_cohorts or /class_cohorts.json
  def create
    @class_cohort = ClassCohort.new(class_cohort_params)

    respond_to do |format|
      if @class_cohort.save
        format.html { redirect_to @class_cohort, notice: "Class cohort was successfully created." }
        format.json { render :show, status: :created, location: @class_cohort }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_cohorts/1 or /class_cohorts/1.json
  def update
    respond_to do |format|
      if @class_cohort.update(class_cohort_params)
        format.html { redirect_to @class_cohort, notice: "Class cohort was successfully updated." }
        format.json { render :show, status: :ok, location: @class_cohort }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_cohorts/1 or /class_cohorts/1.json
  def destroy
    @class_cohort.destroy!

    respond_to do |format|
      format.html { redirect_to class_cohorts_path, status: :see_other, notice: "Class cohort was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_cohort
      @class_cohort = ClassCohort.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def class_cohort_params
      params.expect(class_cohort: [ :name, :class_teacher_id, :grade_id ])
    end
end

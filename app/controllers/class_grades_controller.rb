class ClassGradesController < ApplicationController
  before_action :set_class_grade, only: %i[ show edit update destroy ]

  # GET /class_grades or /class_grades.json
  def index
    @class_grades = ClassGrade.all
  end

  # GET /class_grades/1 or /class_grades/1.json
  def show
  end

  # GET /class_grades/new
  def new
    @class_grade = ClassGrade.new
  end

  # GET /class_grades/1/edit
  def edit
  end

  # POST /class_grades or /class_grades.json
  def create
    @class_grade = ClassGrade.new(class_grade_params)

    respond_to do |format|
      if @class_grade.save
        format.html { redirect_to @class_grade, notice: "Class grade was successfully created." }
        format.json { render :show, status: :created, location: @class_grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_grades/1 or /class_grades/1.json
  def update
    respond_to do |format|
      if @class_grade.update(class_grade_params)
        format.html { redirect_to @class_grade, notice: "Class grade was successfully updated." }
        format.json { render :show, status: :ok, location: @class_grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_grades/1 or /class_grades/1.json
  def destroy
    @class_grade.destroy!

    respond_to do |format|
      format.html { redirect_to class_grades_path, status: :see_other, notice: "Class grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_grade
      @class_grade = ClassGrade.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def class_grade_params
      params.expect(class_grade: [ :grade, :enrollment_year ])
    end
end

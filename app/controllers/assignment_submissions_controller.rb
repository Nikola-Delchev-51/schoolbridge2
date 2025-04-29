class AssignmentSubmissionsController < ApplicationController
  before_action :set_assignment_submission, only: %i[ show edit update destroy ]

  def index
    @assignment_submissions = AssignmentSubmission.all
    @subjects = Subject.order(:name)
  end

  def show
  end

  def new
    @assignment_submission = AssignmentSubmission.new
  end

  def edit
  end

  def create
    @assignment_submission = AssignmentSubmission.new(assignment_submission_params)
    @assignment_submission.student = current_person
    @assignment_submission.date_submitted = Date.current
    respond_to do |format|
      if @assignment_submission.save
        format.html { redirect_to @assignment_submission, notice: "Assignment submission was successfully created." }
        format.json { render :show, status: :created, location: @assignment_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assignment_submission.update(assignment_submission_params)
        format.html { redirect_to @assignment_submission, notice: "Assignment submission was successfully updated." }
        format.json { render :show, status: :ok, location: @assignment_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment_submission.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @assignment_submission.destroy!

    respond_to do |format|
      format.html { redirect_to assignment_submissions_path, status: :see_other, notice: "Assignment submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_assignment_submission
      @assignment_submission = AssignmentSubmission.find(params.expect(:id))
    end

    def assignment_submission_params
      params.expect(assignment_submission: [ :assignment_id, :attempt_number, :grade, :feedback ])
      params.require(:assignment_submission).permit(:assignment_id, :person_id, :file)
    end
end

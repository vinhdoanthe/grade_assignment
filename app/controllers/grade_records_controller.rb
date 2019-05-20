# frozen_string_literal: true

class GradeRecordsController < ApplicationController

  def index; end

  def new
    if params[:rubric_code].present?
      rubric = Rubric.where(rubric_code: params[:rubric_code]).first

      if rubric.nil?
        flash[:notice] = 'Can not load assignment'
      else
        @grade_record = GradeRecord.new
        @grade_record.rubric_id = rubric.id
      end
      if params[:criterias].present?
        criterias_list = params[:criterias].split(',')

      else # load all criterias
        criterias_list = @grade_record.rubric.criterias
        criterias_list.each do |criteria|
          @grade_record.grade_criterias.build(index: criteria.index,
                                              criteria: criteria.criteria,
                                              outcome: criteria.outcome,
                                              meet_the_specification: criteria.meet_the_specification,
                                              mandatory: criteria.mandatory,
                                              criteria_type: criteria.criteria_type,
                                              weight: criteria.weight)

        end

      end
    else
      flash[:notice] = 'Can not load assignment'
    end
    puts "Number of criterias #{@grade_record.grade_criterias.inspect}"
  end

  def create
    @grade_record = GradeRecord.new
    @grade_record.update_attributes(grade_record_params)
    render :graded_completed if @grade_record.save
  end


  def graded_completed; end

  private

  def grade_record_params
    params.require(:grade_record).permit(:rubric_id,
                                         :description,
                                         :comment,
                                         grade_criterias_attributes: %i[index
                                                                      criteria
                                                                      outcome
                                                                      meet_the_specification
                                                                      weight
                                                                      mandatory
                                                                      status
                                                                      point
                                                                      comment])
  end

  def criterias; end
end
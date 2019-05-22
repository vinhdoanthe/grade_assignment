# frozen_string_literal: true

class GradeRecordsController < ApplicationController
  def index;
  end

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
        index_list = params[:criterias].split(',').map(&:to_i)
        puts "index_list #{index_list.inspect}"
        criterias_list = rubric.list_crites(index_list)
        puts "criterias_list #{criterias_list.inspect}"
        criterias_list.each do |criteria|
          @grade_record.grade_crites.build(index: criteria.index,
                                           criteria_description: criteria.criteria_description,
                                           outcome: criteria.outcome,
                                           meet_the_specification: criteria.meet_the_specification,
                                           mandatory: criteria.mandatory,
                                           criteria_type: criteria.criteria_type,
                                           weight: criteria.weight)
        end
      else # load all criterias
        criterias_list = @grade_record.rubric.crites
        criterias_list.each do |criteria|
          @grade_record.grade_crites.build(index: criteria.index,
                                           criteria_description: criteria.criteria_description,
                                           outcome: criteria.outcome,
                                           meet_the_specification: criteria.meet_the_specification,
                                           mandatory: criteria.mandatory,
                                           criteria_type: criteria.criteria_type,
                                           weight: criteria.weight)
        end

      end

      if params[:grade_type].present?
        puts "params[:grade_type] #{params[:grade_type]}"
        if params[:grade_type] == Constants::GRADE_TYPE_REGRADE
          @grade_record.grade_type = Constants::GRADE_TYPE_REGRADE
        else
          @grade_record.grade_type = Constants::GRADE_TYPE_FIRSTGRADE
        end
      end
    else
      flash[:notice] = 'Can not load assignment'
    end
    puts "Number of criterias #{@grade_record.grade_crites.inspect}"
  end

  def create
    @grade_record = GradeRecord.new
    @grade_record.update_attributes(grade_record_params)
    puts "@grade_record #{@grade_record.inspect}"
    @grade_record.calculate_point
    if @grade_record.save
      GradeRecordMailer.complete_grade_email(@grade_record).deliver_later
      render :graded_completed
    else
      # render :new, locals: { rubric_code: @grade_record.rubric.rubric_code }
    end
  end

  def graded_completed;
  end

  private

  def grade_record_params
    params.require(:grade_record).permit(:rubric_id,
                                         :description,
                                         :comment,
                                         :learner_email,
                                         :mentor_email,
                                         :grade_type,
                                         grade_crites_attributes: %i[index
                                                                     criteria_description
                                                                     outcome
                                                                     meet_the_specification
                                                                     criteria_type
                                                                     weight
                                                                     mandatory
                                                                     status
                                                                     point
                                                                     comment])
  end

  def criterias;
  end
end

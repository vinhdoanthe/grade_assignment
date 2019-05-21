class GradeRecordMailer < ApplicationMailer
  default from: 'noreply-assignment@funix.edu.vn'

  def complete_grade_email(grade_record)
    @grade_record = GradeRecord.find(grade_record.id)
    mail(to: "#{@grade_record.learner_email}, #{@grade_record.mentor_email}, #{Constants::KHAO_THI_EMAIL}",
         subject: 'Assignment Grade Result')
  end
end

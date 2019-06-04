# frozen_string_literal: true

class UpdateGoogleSheetJob < ApplicationJob
  queue_as :default
  require 'google_drive'

  def perform(grade_record)
    content = grade_record.build_content
    sheet_rows = []
    sheet_rows.append content
    puts "Sheet rows: #{sheet_rows.inspect}"
    puts "Contents #{content.inspect}"
    session = GoogleDrive::Session.from_config('config.json')
    if grade_record.grade_type == Constants::GRADE_TYPE_FIRSTGRADE
      ws = session.spreadsheet_by_key(ENV['data_file_id']).worksheet_by_title('Score')
    elsif grade_record.grade_type == Constants::GRADE_TYPE_REGRADE
      ws = session.spreadsheet_by_key(ENV['data_file_id']).worksheet_by_title('Rescore')
    end
    puts "Sheet info: #{ws.inspect}"
    puts "WS rows: #{ws.num_rows}"
    ws.insert_rows(ws.num_rows + 1, sheet_rows)
    ws.save

    ## TODO update 'Data' sheet
    unless grade_record.status == Constants::GRADE_STATUS_PASSED
      ws2 = session.spreadsheet_by_key(ENV['data_file_id']).worksheet_by_title('Data')
      puts "ws2 info: #{ws2.inspect}"
      p "ws2 rows: #{ws2.num_rows}"
      (1..ws2.num_rows).each do |index|
        next unless (grade_record.rubric.course_instance.to_s == ws2[index, 2].to_s &&
            grade_record.learner_email == ws2[index, 5].to_s &&
            grade_record.rubric.assignment == ws2[index, 6].to_s &&
            ws2[index, 20] == '')
        puts "rows in Data #{ws2[index, 2]} #{ws2[index, 5]} #{ws2[index, 6]}"
        ws2[index, 20] = 'x'
        break
      end
      ws2.save
    end
  end
end

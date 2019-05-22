class UpdateGoogleSheetJob < ApplicationJob
  queue_as :default
  require "google_drive"

  def perform(grade_record)
    content = grade_record.build_content
    puts "Contents #{content.inspect}"
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("10QacnR6o2v0E_xK3A_tZhVRUgg1dJOfvs4fReBZlBqo").worksheet_by_title('Score')
    puts "Sheet info: #{ws.inspect}"
    puts "WS rows: #{ws.num_rows}"
    ws.insert_rows(ws.num_rows + 1, content)
    ws.save
  end
end

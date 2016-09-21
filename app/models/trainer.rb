class Trainer < ActiveRecord::Base
REFIRENCE = ["yes","no"]
	mount_uploader :avatar, AvatarUploader

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |trainer|
      csv << trainer.attributes.values_at(*column_names)
    end
  end
end



def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    trainer = find_by_id(row["id"]) || new
    trainer.attributes = row.to_hash.slice(*accessible_attributes)
    trainer.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Csv.new(file.path, nil, :ignore)
  when ".xls" then Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end



def self.search(search)
  where("name LIKE ? OR profile_type LIKE ? OR industry LIKE ?  OR experience LIKE ? OR  expertise LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
end

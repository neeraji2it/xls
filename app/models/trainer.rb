class Trainer < ActiveRecord::Base
    validates :profile_type, :industry,:expertise,:geography, :rating,:presence => true
     REFIRENCE = ["yes","no"]
	    mount_uploader :avatar, AvatarUploader

  scope :trainer_profile_type, ->(tprofile_type){where("profile_type = ?", "#{tprofile_type}") if tprofile_type.present?}
  scope :trainer_expertise, ->(texpertise){where("expertise like ?", "#{texpertise}") if texpertise.present?}
  scope :trainer_location, ->(tgeography){where("geography like ?", "#{tgeography}") if tgeography.present?}
  scope :trainer_rating, ->(trating){where("rating = ?", "#{trating}") if trating.present?}


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


  def self.search(name,expertise,location,rating)
    where("profile_type = ? AND (expertise LIKE ? OR geography LIKE ? OR rating = #{rating})","#{name}", "%#{expertise}%", "%#{location}%") 
  end
  
end

class Energy < ApplicationRecord
  belongs_to :house

  scope :chart_by_year, -> (year, house) {where(house: house, year: year).group(:month)}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      energy = find_by(id: row["id"]) || new
      energy.attributes = row.to_hash.slice(*updatable_attributes)
      energy.save!
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "label", "house_id", "year", "month", "temperature", "daylight", "energy_production"]
  end
end

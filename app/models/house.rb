class House < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      house = find_by(id: row["id"]) || new
      house.attributes = row.to_hash.slice(*updatable_attributes)
      house.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["firstname", "lastname", "city", "num_of_people", "has_child"]
  end
end

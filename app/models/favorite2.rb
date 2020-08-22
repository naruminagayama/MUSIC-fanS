class Favorite2 < ApplicationRecord

  belongs_to :customer
  belongs_to :song

  def self.save_from_yaml!(yaml_path)
  	yaml = YAML.load(yaml_path)
  	favorite2 = self.new
  	favorite2.save!
  end

end

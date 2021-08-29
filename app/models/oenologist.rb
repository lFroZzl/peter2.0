class Oenologist < ApplicationRecord
    has_and_belongs_to_many :wines

    has_many :magazineoenologistjobtitles

    has_many :magazines, through: :magazineoenologistjobtitles
    has_many :jobtitles, through: :magazineoenologistjobtitles


end

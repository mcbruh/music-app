class Album < ApplicationRecord

    validates :title, :band_id, :year, :live, presence: true
    belongs_to :band

end

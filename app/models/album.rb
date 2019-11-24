class Album < ApplicationRecord

    validates :title, :band_id, :year, presence: true
    validates :live, inclusion: { in: [true, false] }
    belongs_to :band
    has_many :tracks, dependent: :destroy
    after_initialize :set_defaults

    def set_defaults
        self.live ||= false
    end
end

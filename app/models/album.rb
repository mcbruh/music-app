class Album < ApplicationRecord

    validates :title, :band_id, :year, presence: true
    validates :live, inclusion: { in: [true, false] }
    belongs_to :band
    after_initialize :set_defaults

    def set_defaults
        self.live ||= false
    end
end

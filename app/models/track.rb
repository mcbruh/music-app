class Track < ApplicationRecord

    validates :title, :ord, :album_id, presence: true
    validates :bonus, inclusion: { in: [true, false] }
    belongs_to :album
    after_initialize :set_defaults

    def set_defaults
        self.bonus ||= false
    end

end

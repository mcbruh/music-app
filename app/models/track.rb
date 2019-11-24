class Track < ApplicationRecord

    validates :title, :ord, presence: true
    validates :bonus, inclusion: { in: [true, false] }
    validates :ord, uniqueness: { scope: :album_id }
    belongs_to :album
    after_initialize :set_defaults

    def set_defaults
        self.bonus ||= false
    end

end

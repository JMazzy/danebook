class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile

  validates :first_name,  presence: true,
                          length: { in: 1..50 }
  validates :last_name,   presence: true,
                          length: { in: 1..50 }
  validates :gender,  length: { maximum: 6 },
                      allow_nil: true,
                      allow_blank: true
  validates :school,  length: { maximum: 250 },
                      allow_nil: true,
                      allow_blank: true
  validates :hometown,  length: { maximum: 250 },
                        allow_nil: true,
                        allow_blank: true
  validates :currently_lives, length: { maximum: 250 },
                              allow_nil: true,
                              allow_blank: true
  validates :words_to_live_by, length: { maximum: 1000 }
  validates :about_me, length: { maximum: 1000 }

  validates :user_id, uniqueness: true

  def display_birthday
    "#{Date::MONTHNAMES[birthday.month]} #{birthday.day}, #{birthday.year}"
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end

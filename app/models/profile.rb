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
  validates :phone_number,  allow_nil: true,
                            length: { in: 8..15 }
  validates :words_to_live_by, length: { maximum: 1000 }
  validates :about_me, length: { maximum: 1000 }


  def display_birthday
    "#{Date::MONTHNAMES[birthday.month]} #{birthday.day}, #{birthday.year}"
  end
end

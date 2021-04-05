class Url < ApplicationRecord
    SHORT_URL_LENGTH = 6
    # LONG_URL_VALIDATION_FORMAT = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/

    validates :long_url, presence: true, on: :create
    # validates :long_url, format: {with: LONG_URL_VALIDATION_FORMAT}
    before_create :generate_short_url

    def generate_short_url
        url = ([*("a".."z"),*("0".."9")]).sample(SHORT_URL_LENGTH).join
        old_url = Url.where(short_url: url).last
        if old_url.present?
            self.generate_short_url
        else
            self.short_url = url
        end
    end
end

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true

  def self.random_code
    url_code = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(short_url: url_code)
      url_code = SecureRandom.urlsafe_base64
    end
    url_code
  end

  def self.user_factory(user, long_url)
    ShortenedUrl.new(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: User

end

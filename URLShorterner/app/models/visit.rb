class Visit < ApplicationRecord

  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, shortenedurl_id: shortened_url)
  end

  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :shortenedurl_id,
    class_name: :ShortenedUrl

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end

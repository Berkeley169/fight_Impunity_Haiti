# Video model
# Contains the information for the video
# Videos will probably not be translated
class Video < ActiveRecord::Base
  include Status
  include DocumentsHelper
  include PgSearch
  attr_accessible :name, :date, :vid, :video_langs_attributes, :notes, :tags_attributes, :tag_ids,
                  :new, :in_progress, :pending, :published, :rejected
  has_many :video_langs, dependent: :destroy
  belongs_to :item
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :video_langs
  validates :vid, presence: true
  validate :valid_youtube_link
  after_validation :set_statuses
  multisearchable :against => [:name]

    def get_translations
        self.video_langs
    end

  def valid_youtube_link
    video_id = YouTubeAddy.extract_video_id(self.vid)
    response = Net::HTTP.get("gdata.youtube.com", "/feeds/api/videos/#{video_id}")
    if video_id.nil?
      errors.add(:base, I18n.translate(:youtube_link_error))
    elsif ["Invalid id", "Video not found"].include? response
      errors.add(:base, I18n.translate(:youtube_video_id_error))
    else
      return
    end
  end

	def get_language(lang)
        if self.video_langs.where(:lang => lang)
            self.video_langs.where(:lang => lang).first
        else
            return nil
        end
	end
end

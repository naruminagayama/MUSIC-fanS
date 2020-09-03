class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :nickname, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, unless: :guest?

  has_many :blogs
  has_many :chats
  has_many :favorite_artists, dependent: :destroy
  has_many :favorite_artist_artists, through: :favorite_artists, source: :artist
  has_many :favorite_songs, dependent: :destroy
  has_many :favorite_song_songs, through: :favorite_songs, source: :song
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_customer, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_customer, through: :followed, source: :follower # 自分をフォローしている人

  # ユーザーをフォローする
  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  # ユーザーのフォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(customer)
    following_customer.include?(customer)
  end

  def remember_me
    true
  end

  def self.guest
    find_or_create_by!(last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ',
                       email: 'guest@example.com', nickname: 'ゲスト様') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  mount_uploader :image_id, ImagesUploader

  private

  def guest?
    nickname == 'ゲスト様'
  end

end

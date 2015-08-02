class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :microposts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates(:name, presence: true)
  
  
  def feed
    # 実装イメージ（未完成）
    Micropost.where("user_id = ?", id)
  end
end

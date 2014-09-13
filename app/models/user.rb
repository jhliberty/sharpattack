class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :textbooks, dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'to_user_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'from_user_id'

  validates :name, presence: true
end

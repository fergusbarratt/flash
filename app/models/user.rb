class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :decks
  has_many :flashcards, through: :decks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

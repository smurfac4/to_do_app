class Task < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: { message: "не может быть пустым" }
end
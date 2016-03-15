class Test < ActiveRecord::Base
  mount_uploader :file_url, PdfUploader
  belongs_to :course
  belongs_to :teacher
  scope :order_for_table, lambda { joins(:teacher).order('teachers.name', year: :desc, semester: :asc, test_number: :asc) }

  validates :year, presence: true
  validates :teacher_id, presence: true
  validates :semester, presence: true
  validates :test_number, presence: true
  validates :file_url, presence: true
  validates :course_id, presence: true
end

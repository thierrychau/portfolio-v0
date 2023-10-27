# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :text
#  featured    :boolean          default(TRUE)
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_projects_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Project < ApplicationRecord
  belongs_to :category
end

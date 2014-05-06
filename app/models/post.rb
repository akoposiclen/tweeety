
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, :content, :presence => true
  validates :title, :length => {:minimum => 2 }
  validates :title, :uniqueness => { :message => "Already taken"}
end
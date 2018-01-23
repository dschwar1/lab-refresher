class Task < ActiveRecord::Base
    has_many :chores 
    has_many :children, through: :chores
    
    validates_presence_of :name
    validates_numericality_of :points, greater_than: 0, :only_integer => true
    
    scope :alphabetical, -> { order('name') }
    scope :active, -> { where(active: true) }
    
end

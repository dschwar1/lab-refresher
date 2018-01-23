class Chore < ActiveRecord::Base
    belongs_to :child
    belongs_to :task
    
    validates_date :due_on
    
    scope :by_task, -> { Chore.joins(:task).order('name') }
    scope :chronological, -> { order('due_on') }
    scope :pending, -> { where(completed: false) } 
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> {where('due_on >= ?', Date.today) }
    scope :past, -> { where('due_on < ?', Date.today) }
    
    def status
        unless self.completed
            return 'Pending'
        end
        return 'Completed'
    end
    
end

class Schedule < ActiveRecord::Base
  has_many :projects

  def optimal
    @potential_projects = projects.map { |project| project }
    @selected_projects  = []

    while @potential_projects.length > 0
      @first_end_date = @potential_projects.sort_by { |p| p.end_date }.first
      remove_overlapping_projects
      @selected_projects.push(@first_end_date)
    end

    @selected_projects
  end

private
  def remove_overlapping_projects
    @potential_projects.delete_if do |project| 
      projects_overlap(project, @first_end_date) || project == @first_end_date
    end
  end

  def projects_overlap(project1, project2)
    @duration1 = (project1.start_date..project1.end_date).to_a
    @duration2 = (project2.start_date..project2.end_date).to_a
    @duration1.each { |date| return true if @duration2.include?(date) }
    false
  end
end

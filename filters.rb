# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    return candidates.find {|candidate| candidate[:id] == id }
  end
  
  def experienced?(candidate)
    return candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    candidates.select do |candidate|
      has_experience?(candidate) &&
      has_sufficient_github_points?(candidate) &&
      knows_ruby_or_python?(candidate) &&
      recently_applied?(candidate) &&
      is_of_age?(candidate)
    end
  end
  
  def has_experience?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  def has_sufficient_github_points?(candidate)
    candidate[:github_points] >= 100
  end
  
  def knows_ruby_or_python?(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end
  
  def recently_applied?(candidate)
    candidate[:date_applied] >= 15.days.ago.to_date
  end
  
  def is_of_age?(candidate)
    candidate[:age] >= 18
  end

  def ordered_by_qualifications(candidates)
    candidates.sort_by do |candidate|
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end
  end
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find { |candidate| candidate[:id] == id }
    
  end
  
  def experienced?(candidate)
    
    candidate[:years_of_experience] > 2
  end

  def age?(candidate)
    
    candidate[:age] > 17
  end

  def github?(candidate)
    
    candidate[:github_points] >= 100
  end

  def languages?(candidate)
    
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python') 
  end

  def applied?(candidate)
    
    (Date.today - candidate[:date_applied]).to_i <= 15
  end









  def qualified_candidates(candidates)
    
    candidates.select do |candidate|
      experienced?(candidate) &&
      age?(candidate) &&
      github?(candidate) &&
      languages?(candidate) &&
      applied?(candidate)
    end


  end


  def ordered_by_qualifications(candidates)
  
    candidates.sort_by do |candidate|
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end
  end
  # More methods will go below
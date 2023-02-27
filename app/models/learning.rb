class Learning < ApplicationRecord
  def hour
    (study_time/3600).floor 
  end

  def min(hour)
    ((study_time-(hour*3600))/60).floor 
  end

  def sec(min,hour)
    (study_time-(60*min)-(3600*hour))
  end
end

class Admin::Survey < ActiveRecord::Base
  has_many :survey_results

  # def done
  # end
end

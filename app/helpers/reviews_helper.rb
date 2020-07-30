module ReviewsHelper
  def getStars(rating)
    case rating
    when 1
      'star1'
    when 2
      'star2'
    when 3
      'star3'
    when 4
      'star4'
    else
      'star5'
    end
  end

  def verifyUser?(reviewer, user)
    reviewer === user
  end
end

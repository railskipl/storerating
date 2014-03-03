class BusinessUser
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Letsrate
  letsrate_rateable
  belongs_to :user
  field :user_id, type: String
  field :avg, type: Float ,default:0.0

#Override Methods from Gem
  def rate(stars, user, dirichlet_method=false)

    if can_rate? user
      rates.create! do |r|
        r.stars = stars
        r.rater = user
      end
      if dirichlet_method
        update_rate_average_dirichlet(stars)
      else
        update_rate_average(stars)
      end
    else
      raise 'User has already rated.'
    end
  end

  def update_rate_average(stars)
    b = BusinessUser.find(id)
    if average.nil?
      RatingCache.create! do |avg|
        avg.cacheable_id = self.id
        avg.cacheable_type = self.class.name
        avg.avg = stars
        avg.qty = 1
        b.avg = stars
        b.save
      end
    else
      a = average
      str ||= []
      str << rates.map { |e| e.stars  }
      avg = str.flatten.inject(:+)/str.flatten.length
      a.qty = rates.count
      a.avg = avg
      b.avg = avg
      b.save
      a.save!(validate: false)
    end
  end

  def can_rate?(user)
    role = Role.find_by(name: "business")
    if user.role_id == role.id
      false 
    else
     r =   Rate.find_by(rater_id: user.id,rateable_id: id).nil? rescue nil
     r.nil?
    end
    # user.ratings_given.where(rateable_id: id, rateable_type: self.class.name).size.zero?
  end


end

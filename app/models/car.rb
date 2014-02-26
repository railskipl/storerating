class Car
  include Mongoid::Document
    include Mongoid::Timestamps
  include Mongoid::Letsrate

  letsrate_rateable
  field :name, type: String



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
      if average.nil?
        RatingCache.create! do |avg|
          avg.cacheable_id = self.id
          avg.cacheable_type = self.class.name
          avg.avg = stars
          avg.qty = 1
        end
      else
        a = average
        str ||= []
        str << rates.map { |e| e.stars  }
        avg = str.flatten.inject(:+)/str.flatten.length
        a.qty = rates.count
        a.avg = avg
        a.save!(validate: false)
      end
    end

    def can_rate?(user)
      user.ratings_given.where(rateable_id: id, rateable_type: self.class.name).size.zero?
    end


end

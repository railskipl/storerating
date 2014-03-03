module ApplicationHelper

  def payment_provided?

  end

  def paypal

  end

  def format_boolean(approved)
    if approved
      icon_tick
    else
      icon_cross
    end
  end

  def icon_tick(alt_text='Tick')
    build_image_tag("/assets/admin/001_06.png", alt_text)
  end

  def icon_cross(alt_text='Cross')
    build_image_tag("/assets/admin/001_05.png", alt_text)
  end

  def build_image_tag(image_file, alt_text)
    image_tag(image_file, :size =>"20x20", :alt => alt_text)
  end

  def get_level account
    plan_list = Array.new
    account.map(&:plan_id).each do |plan|
      plan_list.push(Plan.find(plan).name)
    end
    if plan_list.include?("$250")
      return 1
    elsif plan_list.include?("$500")
      return 2
    elsif plan_list.include?("$1000")
      return 3
    else
      return 0
    end
  end


end

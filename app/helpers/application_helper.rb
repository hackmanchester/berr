module ApplicationHelper

	def gravatar_for email, options = {}
	    options = {:alt => 'avatar', :class => 'avatar', :size => 80}.merge! options
	    id = Digest::MD5::hexdigest email.strip.downcase
	    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?d=monsterid&s=' + options[:size].to_s
	    options.delete :size
	    image_tag url, options
	end

	def show_tags(tags)
		tag_string = ""
		if tags && tags.count > 0
			tags.each do |t|
				tag_string = tag_string + "<span class=\"tag label label-success\">#{t.name}</span>"
			end
		end
    tag_string
	end

	def tags_for(tags)
    tag_names = tags.collect do |x|
  			x.name
  	end
  	output = tag_names.join(", ")
	end

end

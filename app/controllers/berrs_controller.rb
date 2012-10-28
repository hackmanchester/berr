class BerrsController < ApplicationController
	before_filter :logged_in

	def index
		#@comments = Comment.where(:deleted => false, :parent_id => nil)
		
		@comments = current_user.tags.collect(&:comments).flatten
		@comments.sort! { |a,b| b.created_at <=> a.created_at }

	end

	def all
		@comments = Comment.where(:deleted => false, :parent_id => nil).order("created_at desc")
	end

	def show
		@comment = Comment.find(params[:id])

		#@children = Comment.where(:parent_id => @comment.id)

		@new_comment = Comment.new
		@new_comment.parent_id = @comment.id
	end

	def new 
		@comment = Comment.new
	end

	def create
		# would be nice to do this via ajax as primary

		@comment = Comment.new(params[:berr])
		@comment.user_id = current_user.id

		tags = params[:tags]
    if tags
			tags.split(/,/).each do |t|
				t.strip!
				n = Tag.find_by_name(t)
				unless n 
					n = Tag.new
					n.name = t
				end
				@comment.tags << n
			end
		end

		if @comment.save
			# needs to redirect to full root of conversation, need to pass it through

			root_comment = @comment.parent
			root_comment ||= @comment

			redirect_to berr_url root_comment
		else
			render "new"
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])

		@comment.tags.destroy_all

		tags = params[:tags]
    if tags
			tags.split(/,/).each do |t|
				t.strip!
				n = Tag.find_by_name(t)
				unless n 
					n = Tag.new
					n.name = t
				end
				@comment.tags << n
			end
		end

		if @comment.update_attributes(params[:berr])
			redirect_to edit_berr_path, :notice => "comment updated"
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if current_user == @comment.user || current_user.admin?
			@comment.deleted = true
			#@comment.save!
			@comment.destroy
		end
		redirect_to root_url
	end
end

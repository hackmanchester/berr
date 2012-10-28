class Comment < ActiveRecord::Base
  attr_accessible :parent_id, :promoted, :text, :title, :user_id
  belongs_to :user

  validates_presence_of :text
	validates :tags, :length => { :minimum => 1, :maximum => 3,
    :too_long => "must be between 1 and 3 words",
    :too_short => "must be at least %{count} words" }, :if => "parent_id.nil?"
  validates :title, :presence => true, :if => "parent_id.nil?"

  has_many :children, :class_name => "Comment", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Comment" 

  has_many :tag_comment_links
  has_many :tags, :through => :tag_comment_links

  before_save :convert_to_markdown

  default_scope order('created_at DESC')

  def tag_string
  	output = ""

  	if tags
  		tag_names = tags.collect do |x|
  			x.name
  		end
  		output = tag_names.join(", ")
  	end

  	output
  end

  def convert_to_markdown
		markdown = Markdown.new(text)
    	self.text_converted = markdown.to_html
	end
end

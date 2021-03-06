module ApplicationHelper
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	TITLE_LENGTH = 40

	def title(item)
		title = item["given_title"]
		title = item["resolved_title"] if title.empty?
		title = "no title" if title.empty?

		if title.length > TITLE_LENGTH
			title[0..(TITLE_LENGTH-3)] + "..."
		else
			title
		end
	end

	ARTICLE_LENGTH = 90

	def article(item)
		article = item["excerpt"]
		article = "no article" if article.empty?

		if article.length > ARTICLE_LENGTH
			article[0..(ARTICLE_LENGTH-3)] + "..."
		else
			title
		end
	end
end

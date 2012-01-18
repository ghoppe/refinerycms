module Refinery
	class PageDecorator < ::ApplicationDecorator
		decorates :page, :class => Refinery::Page
		
		def sections(local_assigns)
			page.parts.collect{ |p|
				{ :title => p.title,
					:yield => symbolize(p.title),
					:html  => p.body
				}
			}
		end
		
		def title_html
			h.content_tag :h1, model.title, id: "body_content_title"
		end
		
		def container_css(local_assigns)
			page.parts.collect{ |p| symbolize(p.title)+"-container"}.join(" ")
		end
		
		private
		
		def symbolize(title)
			title.to_s.gsub(/\ /, '').underscore.to_sym.to_s
		end

	end
end
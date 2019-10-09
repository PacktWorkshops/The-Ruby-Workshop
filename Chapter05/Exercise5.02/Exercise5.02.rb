class SocialShare 

end
class SocialShare 

  @@platforms = { 

    facebook: "https://www.facebook.com/sharer/sharer.php?u=%{url}", 

    twitter: "https://twitter.com/intent/tweet?text=%{url} %{title}", 

    linkedin: "http://www.linkedin.com/shareArticle?mini=true&url=%{url}&title=%{title}&summary=%{summary}&source=Recognize" 

  } 

end 
class SocialShare 

 # @@platforms code omitted for brevity 

  def initialize(platform, url, title, summary = "") 

   @platform = platform.to_sym 

   @share_url = url 

   @title = title 

   @summary = summary 

  end 

end 
def generate_url 

    @@platforms[@platform] % {title: @title, url: @share_url, summary: @summary} 

  end 

end 
class SocialShare 

 

  def url 

    @url ||= generate_url 

  end 

end 
class SocialShare 

  platforms = { 

    facebook: "https://www.facebook.com/sharer/sharer.php?u=%{url}", 

    twitter: "https://twitter.com/intent/tweet?text=%{url} %{title}", 

    linkedin: "http://www.linkedin.com/shareArticle?mini=true&url=%{url}&title=%{title}&summary=%{summary}&source=Recognize" 

  } 

  def initialize(platform, title, url, summary = "") 

    @platform, @title, @share_url, @summary = platform.to_sym, title, url, summary 

  end 

  def url 

    @url ||= generate_url 

  end 

  def generate_url 

    url_string = @@platforms[@platform] % {title: @title, url: @share_url, summary: @summary} 

  end 

end 

#Then, in an IRB console, let's set up some variables that we will reuse when testing: 

title = "Check out this great coding website!" 

url = "packt.com" 
[:twitter, :facebook, :linkedin].each.do |platform| 

puts SocialShare.new(platform, title, url).url 

end 
class SocialShare 

  def self.url(platform, title, url, summary = "") 

    new(platform, title, url, summary).url 

  end 

end 
class SocialShare 

  def self.get_links_for_all(title, url, summary = "") 

    @@platforms.keys.map do |platform| 

      url(platform, title, url, summary) 

    end 

  end 

end 

pp SocialShare.get_links_for_all(title,url) 

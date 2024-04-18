class PagesController < ApplicationController
  def home
    if user_signed_in?
      @contents = current_user.contents
    end
  end

  def about
  end
  def changelog
  
    changelog_path = Rails.root.join('changelog.yml')
    @changelog_data = YAML.load_file(changelog_path)
 
end  
  
end

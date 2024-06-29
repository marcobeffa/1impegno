# app/helpers/contents_helper.rb
module ContentsHelper
  def nested_contents(node)
    content_tag(:li, class: "mb-2") do
      if node[:content].id == @content.id
        concat link_to(node[:content].nome_completo, content_path(node[:content]), class: "font-bold text-indigo-600 hover:underline")
      else
        concat link_to(node[:content].nome_completo, content_path(node[:content]), class: "text-blue-500 hover:underline")
      end

      if node[:children].any?
        concat content_tag(:ul, node[:children].map { |child| nested_contents(child) }.join.html_safe, class: "pl-5")
      end
    end
  end
end
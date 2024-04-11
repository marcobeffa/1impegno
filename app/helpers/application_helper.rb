module ApplicationHelper
  def helper_day(number_day_of_week) 
    if number_day_of_week == 1
      "Lunedì"
    elsif number_day_of_week == 2
      "Martedì"
    elsif number_day_of_week == 3
      "Mercoledì"
    elsif number_day_of_week == 4
      "Giovedì"
    elsif number_day_of_week == 5
      "Venedì"
    elsif number_day_of_week == 6
      "Sabato"
    else
      "Domenica"
    end
  end

  def helper_month(n_day_of_m)
    if n_day_of_m == 1
      "Gennaio"
    elsif n_day_of_m == 2
      "Febbraio"
    elsif n_day_of_m == 3
      "Marzo"
    elsif n_day_of_m == 4
      "Aprile"
    elsif n_day_of_m == 5
      "Maggio"
    elsif n_day_of_m == 6
      "Giugno"
    elsif n_day_of_m == 7
      "Luglio"
    elsif n_day_of_m == 8
      "Agosto"
    elsif n_day_of_m == 9
      "Settembre"
    elsif n_day_of_m == 10
      "Ottobbre"
    elsif n_day_of_m == 11
      "Novembre"
    else
      "Dicembre"
    end
  end
  def avatar(url)
    if url.nil?
      image_url("nav/user.png")    
    else
      if url.length < 3
        image_url("nav/user.png")    
      else
        url
      end
    end
  end
  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks, :tables, :strikethrough,  :with_toc_data]
    Markdown.new(text, *options).to_html.html_safe
  end

end

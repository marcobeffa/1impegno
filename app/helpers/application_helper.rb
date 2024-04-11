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

  def tipo_content_icon(tipo)
    if tipo == "eventi"
      @icona = '<svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z"/>
      </svg>'
    elsif tipo == "attenzione" 
      @icona = '<svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.5 8.43A4.985 4.985 0 0 1 19 12a4.984 4.984 0 0 1-1.43 3.5M14 6.135v11.73a1 1 0 0 1-1.64.768L8 15H6a1 1 0 0 1-1-1v-4a1 1 0 0 1 1-1h2l4.36-3.633a1 1 0 0 1 1.64.768Z"/>
      </svg>'
    elsif tipo == "energia"
      @icona = '<svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.5 8.43A4.985 4.985 0 0 1 19 12a4.984 4.984 0 0 1-1.43 3.5M14 6.135v11.73a1 1 0 0 1-1.64.768L8 15H6a1 1 0 0 1-1-1v-4a1 1 0 0 1 1-1h2l4.36-3.633a1 1 0 0 1 1.64.768Z"/>
      </svg>' 
    elsif tipo == "contatti"          
    elsif tipo == "luogo" 
    elsif tipo == "abilità" 
    end  
    @icona  
  end

end

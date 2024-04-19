class DashvalueJob < ApplicationJob
  queue_as :default

  def perform
    response = HTTParty.get('https://api.coingecko.com/api/v3/simple/price?ids=dash&vs_currencies=eur')
    if response.code == 200
      data = JSON.parse(response.body)
      exchange_rate = data['dash']['eur']
      Dash.create!(eur: exchange_rate)
    else
      Rails.logger.error "Failed to fetch Dash to Euro conversion rate: #{response.code} - #{response.body}"
    end
  rescue => e
    Rails.logger.error "An error occurred while updating Dash to Euro conversion rate: #{e.message}"
  end
end
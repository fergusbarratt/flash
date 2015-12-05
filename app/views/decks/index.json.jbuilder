json.array!(@decks) do |deck|
  json.extract! deck, :id, :name, :description, :recent, :user_id
  json.url deck_url(deck, format: :json)
end

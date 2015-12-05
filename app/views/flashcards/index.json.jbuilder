json.array!(@flashcards) do |flashcard|
  json.extract! flashcard, :id, :front, :back, :recent, :deck_id
  json.url flashcard_url(flashcard, format: :json)
end

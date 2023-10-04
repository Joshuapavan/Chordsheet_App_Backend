ActiveAdmin.register Song do
  permit_params :title, :song, :key, :time_signature, :tempo, :genre, :language

  index do
    selectable_column
    id_column
    column :title
    column :language
    # column :song.truncate(100)
    column :key
    column :time_signature
    column :tempo
    column :genre
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  # filter :song
  filter :key
  filter :time_signature
  filter :tempo
  filter :genre
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title, label: "Song Title"
      f.input :song, label: "Lyrics with Chords"
      f.input :language, as: :select, collection: Language.all.pluck(:name), label: "Language"
      f.input :key, as: :select, collection: ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"] , label: "Song Key"
      f.input :time_signature, as: :select, collection: ["2/4", "3/4", "4/4", "5/4", "6/4", "7/4", "2/8", "3/8", "4/8", "5/8", "6/8", "7/8"], label: "Time Signature"
      # f.input :tempo_slider, as: :range, input_html: { min: 50, max: 170, onchange: "updateTempoValue(this.value)" }
      # f.input :tempo, label: "Tempo", input_html: { disabled: true }
      f.input :tempo
      f.input :genre, as: :select, collection: Genre.all.pluck(:name), label: "Genre"
    end
    f.actions
  end
  
end

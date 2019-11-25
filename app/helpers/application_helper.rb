module ApplicationHelper

    def ugly_lyrics(lyrics)
        pretty_lyrics = ""
        lyrics.each_line do |line|
            pretty_lyrics << "&#9835; #{html_escape(line)}"
        end
        "<pre>#{pretty_lyrics}</pre>".html_safe
    end
end

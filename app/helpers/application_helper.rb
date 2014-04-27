module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
            name="authenticity_token"
            value="#{form_authenticity_token}">
    HTML
  end

  def update_url_with_note(url, note)
    url = url.dup
    if url.include?("?")
      url.gsub!(/note_id=[0-9]+/, "")
    else
      url += "?"
    end
    return url + "note_id=#{note.id}"
  end
end
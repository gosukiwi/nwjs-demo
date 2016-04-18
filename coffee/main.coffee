# CodeMirror editor instance
editor = CodeMirror.fromTextArea document.getElementById('editor'),
    mode: "markdown"
    theme: "monokai"
    height: "auto"
    
preview = document.getElementById('preview')

editor.on 'change', (cm) ->
    md = cm.getValue()
    html = markdown.toHTML(md)
    preview.innerHTML = html
    
window.editor = editor
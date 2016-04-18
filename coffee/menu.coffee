# Load a Node.js module
fs = require('fs')

onFileSaveClick = ->
    input = document.createElement("input")
    input.setAttribute('type', 'file')
    input.setAttribute('nwsaveas', 'my-md-file.md')
    input.onchange = ->
        saveAs input.value
    input.click()
    
onFileExitClick = ->
     nw.App.quit()
     
onAboutClick = ->
    alert "MDEdit 0.0.1"
    
saveAs = (path) ->
    fs.writeFile path, editor.getValue(), (err) ->
        return console.log(err) if(err)
        console.log("The file was saved!")

fileMenu = new nw.Menu()
fileMenu.append new nw.MenuItem(label: 'Save', click: onFileSaveClick)
fileMenu.append new nw.MenuItem(label: 'Exit', click: onFileExitClick)

helpMenu = new nw.Menu()
helpMenu.append new nw.MenuItem(label: 'About', click: onAboutClick)

menu = new nw.Menu(type: 'menubar')
menu.append new nw.MenuItem(label: 'File', submenu: fileMenu)
menu.append new nw.MenuItem(label: 'Help', submenu: helpMenu)

nw.Window.get().menu = menu
canvas = $ '#canvas'
paper = new Raphael canvas, 500, 700
colour = 'black'
mousedown = false
width = 1
lastX = lastY = path = pathString = ''

$(canvas).mousedown (e) ->
    mousedown = true
    x = e.offsetX
    y = e.offsetY

    pathString = 'M #{x} #{y}l0 0'
    path = paper.path pathString
    path.attr
        'stroke': colour,
        'stroke-linecap': 'round',
        'stroke-linejoin': 'round',
        'stroke-width': width

    lastX = x
    lastY = y

$(document).mouseup ->
    mousedown = false
$(canvas).mousemove (e) ->
    if !mousedown
        return

    x = e.offsetX
    y = e.offsetY

    pathString += 'l#{x - lastX} #{y - lastY}'
    path.attr 'path', pathString

    lastX = x
    lastY = y
    nil

$(document).keydown (e) ->
    if e.keyCode > 48 && e.keyCode < 58
        width = e.keyCode - 48
        nil

$('#canvascolours [data-colour]').each ->
    $this = $(this)
    divColour = $this.data 'colour'

    $this.css 'background-color', divColour

    $this.click ->
        colour = divColour;
        nil
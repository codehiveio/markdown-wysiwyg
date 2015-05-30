buttonTypes = 
  addCode: "Enter code here"
  addInlineCode: "Enter inline code here"
  addStrong: "Strong text"
  addEmphasis: "Emphasized text"
  addLink: "https://www.codehive.io"

buttonFunctions =
  addCode: "```\n#{buttonTypes.addCode}\n```\n\n"
  addInlineCode: "`#{buttonTypes.addInlineCode}` "
  addStrong: "**#{buttonTypes.addStrong}** "
  addEmphasis: "*#{buttonTypes.addEmphasis}* "
  addLink: "[Link title](#{buttonTypes.addLink}) "

matchString = (target, textAreaElement, limit) ->
  textArea = document.getElementById(textAreaElement.attr('id'))
  highlight = textArea.value.lastIndexOf(target, limit)
  if highlight >= 0
    textArea.focus()
    textArea.selectionStart = highlight
    textArea.selectionEnd = highlight + target.length

addMarkdown = (buttonType, textArea) ->
  text = textArea.val()
  caretPosition = document.getElementById(textArea.attr('id')).selectionStart
  if buttonType of buttonTypes
    textArea.val(text.substring(0, caretPosition) + buttonFunctions[buttonType] + text.substring(caretPosition, text.length - 1))
    matchString(buttonTypes[buttonType], textArea, caretPosition + buttonTypes[buttonType].length - 1)

$('.form-controls .button').on 'click', () ->
  buttonType = $(this).data('button-type')
  textArea = $(this).parent().parent().find('textarea')
  addMarkdown(buttonType, textArea)

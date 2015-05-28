codeTarget = "Enter code here"
strongTarget = "Strong text"
emphasisTarget = "Emphasized text"
inlineCodeTarget = "Enter inline code here"

matchString = (target)->
  textArea = document.getElementById("board_content")
  textAreaText = textArea.value
  containsString = textAreaText.indexOf(target)
  if(containsString > -1)
    targetEnd = target.length + containsString
    textArea.setSelectionRange(containsString, targetEnd)

$('.addCode-editor').on 'click', () ->
  $('#board_content').val($('#board_content').val() + '```\n' + codeTarget + '\n```\n\n')
  matchString(codeTarget)

$('.addStrong-editor').on 'click', () ->
  $('#board_content').val($('#board_content').val() + '**' + strongTarget + '** ')
  matchString(strongTarget)

$('.addEmphasis-editor').on 'click', () ->
  $('#board_content').val($('#board_content').val() + '*' + emphasisTarget + '* ')
  matchString(emphasisTarget)

$('.addInlineCode-editor').on 'click', () ->
  $('#board_content').val($('#board_content').val() + '`' + inlineCodeTarget + '` ')
  matchString(inlineCodeTarget)

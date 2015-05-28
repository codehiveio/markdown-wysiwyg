(function() {
  var codeTarget, emphasisTarget, inlineCodeTarget, matchString, strongTarget;

  codeTarget = "Enter code here";

  strongTarget = "Strong text";

  emphasisTarget = "Emphasized text";

  inlineCodeTarget = "Enter inline code here";

  matchString = function(target) {
    var containsString, targetEnd, textArea, textAreaText;
    textArea = document.getElementById("board_content");
    textAreaText = textArea.value;
    containsString = textAreaText.indexOf(target);
    if (containsString > -1) {
      targetEnd = target.length + containsString;
      return textArea.setSelectionRange(containsString, targetEnd);
    }
  };

  $('.addCode-editor').on('click', function() {
    $('#board_content').val($('#board_content').val() + '```\n' + codeTarget + '\n```\n\n');
    return matchString(codeTarget);
  });

  $('.addStrong-editor').on('click', function() {
    $('#board_content').val($('#board_content').val() + '**' + strongTarget + '** ');
    return matchString(strongTarget);
  });

  $('.addEmphasis-editor').on('click', function() {
    $('#board_content').val($('#board_content').val() + '*' + emphasisTarget + '* ');
    return matchString(emphasisTarget);
  });

  $('.addInlineCode-editor').on('click', function() {
    $('#board_content').val($('#board_content').val() + '`' + inlineCodeTarget + '` ');
    return matchString(inlineCodeTarget);
  });

}).call(this);

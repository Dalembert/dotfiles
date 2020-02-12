setopt promptsubst
function precmd_vcs_info { vcs_info }
precmd_functions+=( precmd_vcs_info )
# NOTE important to put prompt in single quotes
PROMPT='%B%F{white}%c%f%b${vcs_info_msg_0_} '
# format current git branch in orange
zstyle ":vcs_info:*" formats ":%F{172}%b%f"

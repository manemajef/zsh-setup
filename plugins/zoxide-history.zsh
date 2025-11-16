function zr() {
    zoxide query --list --score \
        | sort -nr \
        | awk '{ $1=""; print substr($0,2) }' \
        | fzf --prompt="Recent dirs > " \
        | xargs -I{} zoxide query --exact "{}" \
        | xargs -I{} cd "{}"
}
function zrr() {
    zoxide query --list --score \
        | sort -k1,1nr \
        | cut -d' ' -f2- \
        | fzf --prompt="Recent > " \
        | xargs cd
}

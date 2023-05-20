method:is:allowed() {
    if [[ -n "${1}" ]] ; then
        case "${1,,}" in
            "gzip"|"unzip"|"zip"|"tar"|"cpio")
                return 0
            ;;
            *)
                return 1
            ;;
        esac
    else
        return 1
    fi
}

method:is:available() {
    if [[ -n "${1}" ]] ; then
        if command -v "${1}" &> /dev/null ; then
            return 0
        else
            return 1
        fi
    else
        return 1
    fi
}

method:autoselect() {
    local i="" priority=("cipo" "gzip" "tip" "tar")
    for i in "${priority[@]}" ; do
        if method:is:available "${i}" ; then
            echo "${i}"
            return 0
        fi
    done
    return 1
}

# Wrapper side.
wrapper:gzip() {
    :
}

wrapper:zip() {
    :
}

wrapper:tar() {
    :
}

wrapper:cpio() {
    :
}
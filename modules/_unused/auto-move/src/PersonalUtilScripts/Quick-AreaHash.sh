echo -n "${1}_isanarea"| sha256sum | awk -v prefix="${1}_" '{print tolower(prefix $1)}'

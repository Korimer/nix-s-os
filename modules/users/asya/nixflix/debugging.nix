{
 
  den.aspects.asya.provides.nixflix.provides.jellyfin-debugging.nixos = { pkgs, lib, ... }:
  {
    #systemd.services.sonarr-downloadclients.serviceConfig.ExecStart = lib.mkForce [
    #  "${pkgs.writeShellScript "sonarr-downloadclients-debug" ''
    #    #!/usr/bin/env bash
    #    set -euxo pipefail
    #    export PS4='+ ''${BASH_SOURCE}:''${LINENO}: '

    #    BASE_URL="http://127.0.0.1:8989/api/v3"

    #    JQ=/nix/store/d6mx57dmjq61j69ap45f6fm3jb0lslyc-jq-1.8.1-bin/bin/jq
    #    CURL=/nix/store/0p84b7rk4ahizd1mdjgq810vhjfdwwj6-curl-8.20.0-bin/bin/curl

    #    SCHEMAS=$($CURL --variable apiKey@/run/agenix/jellyfin_apikey_sonarr \
    #      --expand-header "X-Api-Key: {{apiKey:trim}}" \
    #      "$BASE_URL/downloadclient/schema")

    #    DOWNLOAD_CLIENTS=$($CURL --variable apiKey@/run/agenix/jellyfin_apikey_sonarr \
    #      --expand-header "X-Api-Key: {{apiKey:trim}}" \
    #      "$BASE_URL/downloadclient")

    #    apply_field_overrides() {
    #      local client_json="$1"
    #      local overrides="$2"

    #      echo "$client_json" | $JQ \
    #        --arg apiKey "" \
    #        --arg username "" \
    #        --rawfile passwordContent /run/agenix/jellyfin_pw_bittorrent \
    #        --argjson overrides "$overrides" '
    #          .fields[] |= (
    #            if .name == "apiKey" and $apiKey != "" then .value = $apiKey
    #            elif .name == "username" and $username != "" then .value = $username
    #            elif .name == "password" and ($passwordContent | sub("\n+$"; "")) != "" then
    #              .value = ($passwordContent | sub("\n+$"; ""))
    #            else .
    #            end
    #          )
    #          | . + $overrides
    #          | .fields[] |= (
    #              . as $field
    #              | if $overrides[$field.name] != null
    #                then .value = $overrides[$field.name]
    #                else .
    #                end
    #            )
    #        '
    #    }

    #    FIELD_OVERRIDES='{"enable":true,"host":"192.168.15.1","name":"qBittorrent","port":8282,"tvCategory":"sonarr","urlBase":""}'

    #    SCHEMA=$(echo "$SCHEMAS" | $JQ -r --arg implName qBittorrent '.[] | select(.implementationName == $implName) | @json')

    #    NEW_CLIENT=$(apply_field_overrides "$SCHEMA" "$FIELD_OVERRIDES")

    #    echo "========== SCHEMA =========="
    #    echo "$SCHEMA" | $JQ .

    #    echo "======= FIELD_OVERRIDES ======="
    #    echo "$FIELD_OVERRIDES" | $JQ .

    #    echo "======== NEW_CLIENT ========="
    #    echo "$NEW_CLIENT" | $JQ .

    #    echo "====== TOP LEVEL KEYS ======"
    #    echo "SCHEMA:"
    #    echo "$SCHEMA" | $JQ 'keys'
    #    echo "NEW_CLIENT:"
    #    echo "$NEW_CLIENT" | $JQ 'keys'

    #    CURL_DATA_FILE=$(mktemp)
    #    trap 'rm -f "$CURL_DATA_FILE"' EXIT

    #    echo "$NEW_CLIENT" >"$CURL_DATA_FILE"

    #    echo "====== REQUEST BODY ======"
    #    cat "$CURL_DATA_FILE" | $JQ .

    #    echo "====== POST ======"

    #    exec $CURL \
    #      --variable apiKey@/run/agenix/jellyfin_apikey_sonarr \
    #      --expand-header "X-Api-Key: {{apiKey:trim}}" \
    #      -v \
    #      -H "Content-Type: application/json" \
    #      --data-binary @"$CURL_DATA_FILE" \
    #      "$BASE_URL/downloadclient"
    #    ''}"
    #    ];
  };
}

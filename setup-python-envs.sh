#!/usr/bin/env bash
set -euo pipefail

# Recreate the named local environments. Project packages are installed separately.
for tool in uv pyenv; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        printf 'Missing %s. Install uv, pyenv, and pyenv-virtualenv first.\n' "$tool" >&2
        exit 1
    fi
done

pyenv_root="$(pyenv root)"
mkdir -p "$pyenv_root/versions"

ensure_env() {
    local name="$1" version="$2" target="$pyenv_root/versions/$1"
    local actual interpreter

    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ ! -x "$target/bin/python" ]; then
            printf '%s exists but has no working Python: %s\n' "$name" "$target" >&2
            return 1
        fi
        actual="$("$target/bin/python" -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')"
        if [ "$actual" != "$version" ]; then
            printf '%s uses Python %s; expected %s. Leaving it unchanged.\n' "$name" "$actual" "$version" >&2
            return 1
        fi
        printf '%s: already present (Python %s)\n' "$name" "$version"
        return
    fi

    uv python install "$version"
    interpreter="$(uv python find --managed-python --no-python-downloads "$version")"
    uv venv --seed --python "$interpreter" "$target"
    printf '%s: created (Python %s)\n' "$name" "$version"
}

ensure_env sys 3.12

printf '\nNamed environments are ready. Select one with `pyenv global <name>` or `pyenv local <name>`.\n'

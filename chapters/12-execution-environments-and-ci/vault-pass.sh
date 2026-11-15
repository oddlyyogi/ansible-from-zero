#!/bin/sh
# Vault password client: AWX passes the password in an environment variable;
# on our own machine it comes from .vault_pass, which is never committed.
if [ -n "$LAB_VAULT_PASSWORD" ]; then
  printf '%s\n' "$LAB_VAULT_PASSWORD"
else
  cat "$(dirname "$0")/.vault_pass"
fi

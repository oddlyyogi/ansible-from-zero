#!/bin/sh
# Vault password client: AWX passes the password in an environment variable;
# on our own machine it comes from the .vault_pass file, which is never committed.
if [ -n "$LAB_VAULT_PASSWORD" ]; then
  printf '%s\n' "$LAB_VAULT_PASSWORD"
else
  cat .vault_pass
fi

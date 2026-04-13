#!/usr/bin/env bash
# xsn.sh — helper CLI for checking a project against the XSN standard
# Usage: ./scripts/xsn.sh <command>
# Scope: XSN structure, audit checks, and maturity scoring for the current project



set -euo pipefail

VERSION="3.3"
CONFIG="config/xsn.config.json"

usage() {
  echo "XSN CLI v${VERSION}"
  echo ""
  echo "Scope: check the current project against the XSN standard"
  echo ""
  echo "Commands:"
  echo "  init    Scaffold a new project following XSN structure"
  echo "  audit   Check the current project against XSN rules"
  echo "  score   Report the current XSN maturity level (DO/RIGHT/BETTER)"
  echo "  help    Show this help text"
  echo ""
}

cmd_init() {
  echo "[XSN] Initializing project structure..."
  dirs=(src/domain src/application src/infrastructure src/interfaces src/i18n src/shared tests config scripts docs)
  for d in "${dirs[@]}"; do
    mkdir -p "$d"
    echo "[XSN]   created $d/"
  done
  echo "[XSN] Done. Edit config/xsn.config.json to configure your project."
}

cmd_audit() {
  echo "[XSN] Running audit..."
  pass=0
  fail=0

  check() {
    if [ -e "$1" ]; then
      echo "  [OK]   $1"
      pass=$((pass + 1))
    else
      echo "  [MISS] $1"
      fail=$((fail + 1))
    fi
  }

  check "src/domain"
  check "src/application"
  check "src/infrastructure"
  check "src/interfaces"
  check "src/i18n"
  check "src/shared"
  check "tests"
  check "docs"
  check "$CONFIG"

  echo ""
  echo "[XSN] Audit complete: ${pass} present, ${fail} missing."
}

cmd_score() {
  echo "[XSN] Scoring project maturity..."
  if [ ! -d "src" ]; then
    echo "  Level: PRE-DO (no /src found)"
    exit 0
  fi
  if [ ! -d "tests" ]; then
    echo "  Level: DO (tests directory missing)"
    exit 0
  fi
  echo "  Level: (implement coverage check for RIGHT/BETTER scoring)"
  echo "  Tip: Integrate with your test runner to automate this."
}

case "${1:-}" in
  init)   cmd_init ;;
  audit)  cmd_audit ;;
  score)  cmd_score ;;
  help|--help|-h) usage ;;
  *)      usage ;;
esac

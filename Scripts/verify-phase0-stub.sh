#!/usr/bin/env bash
# Confirms the Phase 0 stub: kernel and pipeline tests pass, and the two
# coverage gates fail closed because no SOURCE pack has been ingested.
set -u
cd "$(dirname "$0")/.."

swift test --filter PeakerKernelTests
kernel=$?
swift test --filter PeakerDataTests
data=$?
swift test --filter PeakerGateTests
gate=$?

echo "PeakerKernelTests=$kernel PeakerDataTests=$data PeakerGateTests=$gate"
if [ "$kernel" -ne 0 ] || [ "$data" -ne 0 ]; then
  echo "Foundation tests failed."
  exit 1
fi
if [ "$gate" -eq 0 ]; then
  echo "Gates passed. That is only valid after a real coverage pack is published."
  exit 2
fi
echo "Foundation tests passed. campaign_chronology and five_year_coverage_gate failed closed (expected until SOURCE coverage exists)."
exit 0
